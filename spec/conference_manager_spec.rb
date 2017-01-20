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


    it 'sorts the talks by duration in descending order' do
      # manager = ConferenceManager.new([talk_two, talk_one, talk_three])
      #
      # # expect(manager.talks).to eq [talk_three, talk_two, talk_one]
      # p manager.talks
      # expect(manager.talks).to_not eq [talk_one, talk_two, talk_three]

    end

    context '#organise' do



    end


  end

end
