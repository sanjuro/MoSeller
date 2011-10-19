# This singleton class stores configuration options.
# It makes use of Ruby's method_missing method
# Any option added to the application's config file
# is automatically available as a method of the same name.
#
class AppConfig
  include Singleton

  # This file is used to set the configuration options for the application.
  CONFIG_FILE = "#{Rails.root.to_s}/config/config.yml"

  def initialize
    @parser = YamlAppConfigParser.new(CONFIG_FILE)
  end

  def method_missing(methId)
    instance_sym = ("@" + methId.id2name).to_sym
    instance_variable_set(instance_sym, @parser.send(methId)) unless instance_variable_get(instance_sym)
    instance_variable_get(instance_sym)
  end
end