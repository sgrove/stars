RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')
require 'digest/sha1'

Rails::Initializer.run do |config|
  config.time_zone = 'UTC'
  config.gem 'authlogic'
  config.gem 'facebooker'
  config.gem 'hoptoad_notifier'

  config.action_mailer.default_url_options ||= {:host => 'localhost:3000'}

  config.action_controller.session = { :key => "_myapp_session", :secret => Digest::SHA1.hexdigest( ENV['BUSHIDO_SALT'] )}
end

ActionView::Helpers::AssetTagHelper.
    register_javascript_expansion :jquery => [
  'http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js',
  'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js'
]

