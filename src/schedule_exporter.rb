
class ScheduleExporter

  def initialize(schedule_builder)
    @schedule = schedule_builder.schedule
  end

  def preview_schedule

    puts @schedule.flatten

  end

  private

end
