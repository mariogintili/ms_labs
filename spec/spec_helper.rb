$LOAD_PATH << File.join(File.dirname(__FILE__),'..')
require "lib/environment"
require "pry"

include MsLabs

def reduce_half_per_pair(jeans)
  result = jeans.each_slice(2).map do |jeans_array|
    if jeans_array.length == 2
      jeans_array.first.price + (jeans_array.first.price / 2.0)
    else
      jeans_array.first.price
    end
  end
  result.inject(:+)
end

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
  ->(products) do
    jeans  = products.select { |p| p.code == jean_code }
    others = products.reject { |p| p.code == jean_code }
    if jeans.any?
      discounted_jeans_price = reduce_half_per_pair(jeans)
    else
      discounted_jeans_price = 0.0
    end
    discounted_jeans_price + others.map(&:price).inject(:+).to_f
  end
end

def test_console
  binding.pry if ENV['CONSOLE'] == 'true'
end

RSpec.configure do |config|

  config.after(:suite) do
    test_console
  end

  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end