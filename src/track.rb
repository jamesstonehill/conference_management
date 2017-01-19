# Need to require the session file for this class because the creation of
# sessions is part of the default behaviour of this class
require_relative './session.rb'

class Track
  attr_reader :schedule

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
    @schedule = nil
  end

  def add_talk(talk)

    @sessions.each do |session|
      if add_talk_to(talk, session)
        return true
      end
    end

    false
  end

  def update_schedule

    # a formatted track will have this data structure:
    schedule = {morning: {}, lunch: {}, afternoon: {}, evening: {}}

    @talks = talks.sort_by! {|talk| talk.minutes}


    # helpful to get the sessions in order so that the shortest one is always first.
    @sessions.order_by! {|session| session.minutes}
    @session.reverse

    @schedule = schedule
  end

  private

  def build_session(session, key, event_time = Time.new(60 * 60 * 9)) # 9:00 AM

    session.talks.each do |talk|
      schedule[key][event_time] = talk.details

      # incriment the event time so that the next event takes place at the end
      # of the first event
      event_time += talk.minutes * 60
    end
  end

  def add_talk_to(talk, session)
    if session.add_talk talk
      return true
    end

    false
  end
end
