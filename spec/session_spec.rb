require_relative './../src/session.rb'

describe Session do
  let(:talk_one) {double :talk}
  let(:talk_two) {double :talk}
  let(:talk_three) {double :talk}

  before(:each) do
    allow(talk_one).to receive(:minutes).and_return(30)
    allow(talk_two).to receive(:minutes).and_return(45)
    allow(talk_three).to receive(:minutes).and_return(60)
  end

  describe '#add_talk' do

    context 'successfully adding talks' do
      it 'returns true when successfully storing an object' do
        session = Session.new(60 * 3)

        expect(session.add_talk(talk_one)).to eq true
      end

      it 'stores Talk objects' do
        session = Session.new(60 * 3)

        session.add_talk(talk_one)
        session.add_talk(talk_two)
        session.add_talk(talk_three)

        expect(session.talks).to eq [talk_one, talk_two, talk_three]
      end
    end

    context 'unsuccessfully adding talks' do
      before(:each) do
        @short_session = Session.new(60 * 2)

        @short_session.add_talk(talk_one)
        @short_session.add_talk(talk_two)
      end

      it 'does not allow you to store talks with a sum duration > its own duration' do
        @short_session.add_talk(talk_three)
        expect(@short_session.talks).to eq [talk_one, talk_two]
      end

      it 'returns false when unable to store a session' do
        expect(@short_session.add_talk(talk_three)).to eq false
      end
    end
  end
end
