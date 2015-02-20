ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
require 'factory_girl'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  self.use_transactional_fixtures = true
  # Add more helper methods to be used by all tests here...
end

class ActionController::TestCase
    include Devise::TestHelpers
end
