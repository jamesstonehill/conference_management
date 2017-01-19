class Session
  attr_reader :minutes, :talks

  def initialize(minutes)
    @minutes = minutes #the total alloted minutes for this section
    @talks = []
  end

  def add_talk(talk)
    if talks_duration + talk.minutes > @minutes
      return false
    else
      @talks << talk
      return true
    end
  end

  private

  def talks_duration
    duration = 0

    @talks.each do |talk|
      duration += talk.minutes
    end

    duration
  end
end
