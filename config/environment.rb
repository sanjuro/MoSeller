# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Moseller::Application.initialize!

# Include your application configuration below
ActiveRecord::Base.pluralize_table_names = false