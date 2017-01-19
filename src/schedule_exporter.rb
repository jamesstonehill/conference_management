# require 'fileutils'
# require 'pathname'
#
# class ScheduleExporter
#
#   def initialize(conference_manager)
#     @conference_manager = conference_manager
#   end
#
#   def print_schedule
#     @conference_manager
#   end
#
#   def save_schedule_in(directory_name, file_name)
#     pn = Pathname.new(file_path)
#
#     File.open(pn, [w]) do
#       @conference_manager.tracks.each do |track|
#
#       end
#     end
#
#
#     {|f| f.write("write your stuff here") }
#
#
#   end
#
#   private
#
#   def create_file(file_path = "./schedule.txt")
#
#     unless File.directory?(dir)
#       FileUtils.mkdir_p(dir)
#     end
#
#     path << ".#{extension}"
#     File.new(path, 'w')
#   end
# end
