RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.frameworks -= [ :active_resource, :action_mailer ]
  config.time_zone = 'UTC'
  
  CONFIG = YAML.load_file('config/config.yml')[RAILS_ENV]
  
  config.action_controller.session = {
    :key => CONFIG['session_key'],
    :secret => CONFIG['session_secret']
  }

  config.gem 'faker'  
  config.gem 'populator'
  config.gem 'notahat-machinist', :lib => 'machinist', :source => 'http://gems.github.com'
  
end
