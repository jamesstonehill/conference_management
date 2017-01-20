require_relative './../src/conference_manager.rb'

describe ConferenceManager do
  let(:talk_one) {double :talk}
  let(:talk_two) {double :talk}
  let(:talk_three) {double :talk}

  before(:each) do
    allow(talk_one).to receive(:minutes).and_return(30)
    allow(talk_two).to receive(:minutes).and_return(45)
    allow(talk_three).to receive(:minutes).and_return(60)
  end

  describe '#initialize' do

    it 'sorts the talks by duration in descending order'

    context '#organise' do

      it 'distributes one talk' do
        manager = ConferenceManager([talk_one])
        manager.
      end


    end
  end
end
