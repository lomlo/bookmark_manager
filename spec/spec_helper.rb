ENV['RACK_ENV'] = 'test'
# Generated by rspec-sinatra. (2016-06-14 11:08:26 +0100)



require File.join(File.dirname(__FILE__), '..', 'app.rb')

require "./app.rb"
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'


Capybara.app = Bookmark

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:suite) do
   DatabaseCleaner.strategy = :transaction
   DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
