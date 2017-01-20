
class ScheduleExporter

  def initialize(schedule_builder)
    @schedule = schedule_builder.schedule
  end

  def preview_schedule
    # @schedule.each do |track_name , track |
    #
    #   puts track_name
    #
    #   track["monring_session"].each do |index_number, talk|
    #     puts "#{talk[:start_time]} #{talk[:details]}"
    #   end
    #
    # end

    puts @schedule.flatten

  end

  private

  def print_session(session)
    session.each do |number, talk|
      puts "#{talk[:start_time]} #{talk[:details]}"
    end
  end
  #
  # def print_lunch(session)
  #
  # end
  #
  # def print_networking_event(session) do
  #
  # end

end
