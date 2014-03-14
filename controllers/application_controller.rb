# This is the main application controller. It is mounted as the Rack application
# in config.ru. The purpose of this class is to provide an inheritance point for
# the rest of our controllers.

# Do not code routes or controller actions within this class.

class ApplicationController < Sinatra::Base


 configure :development do
    register Sinatra::Reloader
 end

  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

end