require_relative './../src/track.rb'

describe Track do
  let(:talk_one) {double :talk}
  let(:talk_three) {double :talk}

  before(:each) do
    allow(talk_one).to receive(:minutes).and_return(30)
    allow(talk_three).to receive(:minutes).and_return(60)
  end

  describe '#initialize' do

    # it 'creates two session upon creation and stores them in readable array' do
    #   track = Track.new
    #
    #   track.sessions.each do |session|
    #     expect(session).to be_kind_of Session
    #   end
    #
    #   expect(track.sessions.length).to eq 2
    # end
  end

  describe '#add_talk' do

    it 'returns true when successfully placing a talk' do
      expect(subject.add_talk(talk_one)).to eq true
    end

    it 'returns false when unsuccessfully placing a talk' do
      full_track = Track.new
      # a full track is one that has (3 * 60) + (4 * 60) mins worth of sessions in it

      # fill track with 7 * 60 min talks and get true each time
      expect(full_track.add_talk(talk_three)).to eq true
      expect(full_track.add_talk(talk_three)).to eq true
      expect(full_track.add_talk(talk_three)).to eq true
      expect(full_track.add_talk(talk_three)).to eq true
      expect(full_track.add_talk(talk_three)).to eq true
      expect(full_track.add_talk(talk_three)).to eq true
      expect(full_track.add_talk(talk_three)).to eq true

      # now the full_track is full so it should not accept any new talks
      expect(full_track.add_talk(talk_three)).to eq false
    end

  end
end
