class ConferenceManager
  attr_reader :tracks

  def initialize(talks, number_of_tracks = 2)
    @talks = talks.sort_by! {|talk| talk.minutes}
    @tracks = []

    number_of_tracks.times do
      @tracks << Track.new
    end

    #decided organise should be called on initialisation
    organise
  end

  private

  def organise

    @talks.each do |talk|
      catch :talk_distributed do

        @tracks.each do |track|

          if track.add_talk talk
            throw :talk_distributed
          elsif track == @tracks.last
            return not_enough_time_for_all_talks
          end
        end
      end
    end

    organise_successful
  end

  def not_enough_time_for_all_talks
    puts 'not_enough_time_for_all_talks'
    # do whatever should be done when you have too many talks. Maybe raise an
    # exception of some kind.
  end

  def organise_successful
    puts 'organise_successful'
    # do whatever should be done when you have too many talks. Maybe it should
    # initialize a ScheduleExporter and print itself? That's actually quite interesting
    # I'm genuienly not sure if that would be a good OO decision or not.
  end

end
