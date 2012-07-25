#VVERBOSE=1 QUEUE=* rake resque:work
require "resque/tasks"  
      
task "resque:setup" => :environment  