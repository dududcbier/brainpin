# Load the Rails application.
require_relative 'application'

Rails.logger = Logger.new(STDOUT)

# Initialize the Rails application.
Rails.application.initialize!
