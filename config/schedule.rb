# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/var/log/cron.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# set :environment, ENV['RAILS_ENV']
# env :PATH, ENV['PATH']
# env :BUNDLE_PATH, '/usr/local/bundle'
# env :GEM_HOME, '/usr/local/bundle'
# env :BUNDLE_APP_CONFIG, '/usr/local/bundle'
set :job_template, "/bin/sh -l -c ':job'"
set :environment, ENV["RAILS_ENV"]

every 1.day, at: "20:05 am" do
  runner "Importer.new(:poi, :int_development)"
  runner "Importer.new(:event, :int_development)"
end

every 1.day, at: "21:05 am" do
  runner "Importer.new(:poi, :bb_michendorf)"
  runner "Importer.new(:event, :bb_michendorf)"
end

every 1.day, at: "22:05 am" do
  runner "Importer.new(:poi, :bb_kyritz)"
  runner "Importer.new(:event, :bb_kyritz)"
end

every 1.day, at: "23:05 am" do
  runner "Importer.new(:poi, :herzberg_elster)"
  runner "Importer.new(:event, :herzberg_elster)"
end

every 1.day, at: "00:05 am" do
  runner "Importer.new(:poi, :bad_belzig)"
  runner "Importer.new(:event, :bad_belzig)"
end

every 1.day, at: "01:05 am" do
  runner "Importer.new(:poi, :eisenhuettenstadt)"
  runner "Importer.new(:event, :eisenhuettenstadt)"
end

every 1.day, at: "02:05 am" do
  runner "Importer.new(:poi, :amt_schlieben)"
  runner "Importer.new(:event, :amt_schlieben)"
end

every 1.day, at: "03:05 am" do
  runner "Importer.new(:poi, :birkenwerder)"
  runner "Importer.new(:event, :birkenwerder)"
end

every 1.day, at: "04:05 am" do
  runner "Importer.new(:poi, :bb_falkenberg_elster)"
  runner "Importer.new(:event, :bb_falkenberg_elster)"
end

every 1.day, at: "05:05 am" do
  runner "Importer.new(:poi, :bb_frankfurt)"
  runner "Importer.new(:event, :bb_frankfurt)"
end

every 1.day, at: "06:05 am" do
  runner "Importer.new(:poi, :bb_gransee)"
  runner "Importer.new(:event, :bb_gransee)"
end

# Learn more: http://github.com/javan/whenever
