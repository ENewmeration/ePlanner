require 'rubygems'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'factory_girl_rails'
require 'database_cleaner'
require 'capybara/rspec'
require 'capybara/rails'

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.order = 'random'
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
    # if session exists in the context, then add mock login data to get past openid login screen
    # these values are based off of the expectations for a valid login found in cerner_openid_client
    if respond_to?(:session)
      # add 5 minutes to the expiration
      session[:expires_at] = 5.minutes.from_now.to_s
      # add a 'somewhat' valid user
      session[:associate] = {
                id:             "TU012345",
                first_name:     "Test",
                last_name:      "User",
                email:          "Test.User@cerner.com",
                phone_default:  "555-555-5555",
                phone_cell:     "555-555-5555",
                identity_uri:   "https://associates.sandboxcerner.com/accounts/person/TU012345"
      }
      # make sure there was a valid login response
      session[:oid_response] = {Login_status: :success}
    end
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    FileUtils.rm_rf(Dir["#{Rails.root}/spec/paperclip_test_files/"])
  end
end