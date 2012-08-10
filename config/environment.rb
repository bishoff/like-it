# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TestApp::Application.initialize!

# Rails.logger = Logger.new(STDOUT)
# Rails.logger = Log4r::Logger.new("application.log")

# Rails.logger = Log4r::Logger.new("#{Rails.root}/log/application.log")