# frozen_string_literal: true

require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './../controller.rb'
require_relative './setup_test_database'

# require 'web_helper'

Capybara.app = Bookmark_Manager

ENV['ENVIRONMENT'] = 'test'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([SimpleCov::Formatter::Console])
# Want a nice code coverage website? Uncomment this next line
# SimpleCov::Formatter::HTMLFormatter
SimpleCov.start

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
  
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
