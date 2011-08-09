# MoProductsource
%w{ models controllers helpers }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'app', dir)
  $LOAD_PATH << path
  ActiveSupport::Dependencies.autoload_paths << path
  ActiveSupport::Dependencies.autoload_once_paths.delete(path)
end

# Adding plugins views
ActionController::Base.view_paths = 
  ActionController::Base.view_paths + 
  [ File.join(File.dirname(__FILE__), 'app', 'views') ]
