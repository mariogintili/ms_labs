$LOAD_PATH << File.join(File.dirname(__FILE__),'..')
require "lib/environment"
require "pry"

include MsLabs

def delivery_rules
  ->(total) do
    case 
    when 50.0 > total
      4.95
    when total.between?(50.0, 90.0)  
      2.95
    when total > 90
      0.0
    end
  end
end

def jeans_offer
  BuyOneGetOneHalfPrice.new(Product.find("J01"))
end

def default_datasource
  {
    "J01" => { price: 32.95 },
    "B01" => { price: 24.95 },
    "S01" => { price: 7.95 },
  }
end

def test_console
  binding.pry if ENV['CONSOLE'] == 'true'
end

RSpec.configure do |config|

  config.after(:suite) do
    test_console
  end

  config.before do
    MsLabs::Product.datasource = default_datasource
  end

  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end