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
        update_schedule
        return true
      end
    end

    update_schedule
    false
  end

  def update_schedule
    morning_session_start_time = Time.new(60 * 60 * 9) # 09:00 AM
    lunch_time = Time.new(60 * 60 * 12) # 12:00 PM
    afternoon_session_start_time = Time.new(60 * 60 * 13) # 13:00 PM
    networking_time = Time.new(60 * 60 * 17) # 17:00 PM

    # a formatted track will have this data structure:
    # @schedule = {morning: {}, lunch: {}, afternoon: {}, evening: {}}

    @schedule[:morning] = build_session(@sessions[0], morning_session_start_time)
    @schedule[:lunch] = {lunch_time => "Lunch"}
    @schedule[:afternoon] = build_session(@sessions[1], afternoon_session_start_time)
    @schedule[:evening] = {networking_time => "Networking Event"}
  end

  private

  def build_session(session, event_time = Time.new(60 * 60 * 9)) # 9:00 AM Default
    session_data = {}

    session.talks.each do |talk|
      session_data[event_time] = talk.details

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
