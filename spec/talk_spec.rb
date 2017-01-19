require_relative './../src/talk.rb'

describe Talk do
  before(:each) do
    @regular_talk = Talk.new("Writing Fast Tests Against Enterprise Rails 60min")
  end

  it 'is able to extract the time of the event in mins' do
    expect(@regular_talk.minutes).to eq 60
  end

  it 'stores the full description of the talk' do
    expect(@regular_talk.details).to eq "Writing Fast Tests Against Enterprise Rails 60min"
  end

  context 'dealing with lightning events' do
    before(:each) do
      @lightning_talk = Talk.new("Rails for Python Developers lightning")
    end

    it 'is able to correctly recognise lightning as meaning 5mins long talk' do
      expect(@lightning_talk.minutes).to eq 5
    end

    it 'stores the full description of the talk' do
      expect(@lightning_talk.details).to eq "Rails for Python Developers lightning"
    end
  end
end
