set :environment, :development
set :output, "log/cron_log.log"
 
every 1.minutes do
	  runner "Tasks::HelloTask.execute"
end
