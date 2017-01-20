# Need to require the session file for this class because the creation of
# sessions is part of the default behaviour of this class
require_relative './session.rb'

class Track
  attr_reader :sessions
  
  MORNING_DURATION = 3 * 60 #in minutes
  AFTERNOON_DURATION = 4 * 60 #in minutes

  def initialize
    # track object should handle creation of sessions assuming this creation
    # behaviour is standardised and won't change
    morning = Session.new(MORNING_DURATION)
    afternoon = Session.new(AFTERNOON_DURATION)

    #Just in case the session structure changes in the future it's easier to
    # keep them all in an array that can be treated the same regardless of the
    # number of sessions that exists
    @sessions = [morning, afternoon]
  end

  def add_talk(talk)

    @sessions.each do |session|
      if add_talk_to(talk, session)

        return true
      end
    end

    false
  end

  private

  def add_talk_to(talk, session)
    if session.add_talk talk
      return true
    end

    false
  end
end
