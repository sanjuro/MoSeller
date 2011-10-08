# This class parses /config/application.yml
# It supports both default and environment options.
# Environment options override the default options.
class YamlAppConfigParser

  def initialize(yaml_file)
    @yaml = YAML.load_file(yaml_file)
  end

  def method_missing(methId)
    if @yaml[RAILS_ENV] && @yaml[RAILS_ENV][methId.id2name]
      @yaml[RAILS_ENV][methId.id2name]
    else
      @yaml['default'][methId.id2name]
    end
  end
end