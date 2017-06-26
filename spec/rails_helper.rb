require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require File.join(File.dirname(__FILE__), 'support/factory_girl')
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
# include JsonHelper
include AuthenticationHelper
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.include RSpec::Rails::ViewRendering
end
