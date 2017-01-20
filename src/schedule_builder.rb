class ScheduleBuilder
  attr_reader :schedule

  def initialize(conference_manager)
    @conference_manager = conference_manager

    build_schedule
  end

  private

  def build_schedule
    {track_one: {morning_session: {}, afternoon_session:{}} }
    @schedule = {}

    @conference_manager.tracks.each_with_index do |track, index|

      @schedule["track_#{index + 1}"] = track_builder(track)
    end
  end

  def track_builder(track)
    return_track = {}
    morning_session = track.sessions.first
    afternoon_session = track.sessions.last

    morning_start_time = Time.at(60 * 60 * 8) # 9:00 AM
    afternoon_start_time = Time.at(60 * 60 * 12) # 13:00 PM

    return_track["morning_session"] = session_builder(morning_session, morning_start_time)
    return_track["afternoon_session"] = session_builder(afternoon_session, afternoon_start_time)

    return_track
  end

  def session_builder(session, start_time)
    return_session = {}

    session.talks.each_with_index do |talk, index|
      return_session[index] = {start_time: start_time, details: talk.details}

      start_time += talk.minutes * 60
    end

    return_session
  end

end
