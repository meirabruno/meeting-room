# frozen_string_literal: true
# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'devise'

abort('The Rails environment is running in production mode!') if Rails.env.production?

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::ControllerHelpers, type: :view
  config.include Devise::Test::IntegrationHelpers
  config.include Warden::Test::Helpers

  config.before :suite do
    Warden.test_mode!
  end

  config.use_transactional_fixtures = false

  config.before :each do
    DatabaseCleaner.strategy = if Capybara.current_driver == :rack_test then
                                 :transaction
                               else
                                 :truncation
                               end
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
