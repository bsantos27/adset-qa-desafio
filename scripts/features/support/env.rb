require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "selenium-webdriver"
require "capybara/rspec"

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = "https://www.adset.com.br"
  config.default_max_wait_time = 5
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
