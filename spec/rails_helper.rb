ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true


  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

end

module TestHelpers

  def create_admin
    User.create(name: "Mr.Admin",
                    username: "admin",
             password_digest: "password",
                        role: 1)
  end

  def create_user
    User.create(name: "Jenny",
            username: "Jenny",
            password: "password")
  end

  def create_reward
    Reward.create(name: "pokemon",
            point_cost: 3)
  end
end
