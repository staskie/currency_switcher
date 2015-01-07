require 'fakeweb'
require 'stringio'

$:.unshift(File.join(File.dirname(__FILE__), '../lib'))

require 'currency_switcher'

def mock_usd_to_gbp
  File.open(File.join(File.dirname(__FILE__), 'support/html/usd_to_gbp.html')).read
end

def mock_eur_to_usd
  File.open(File.join(File.dirname(__FILE__), 'support/html/eur_to_usd.html')).read
end

RSpec.configure do |config|
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    # This option will default to `true` in RSpec 4. It makes the `description`
    # and `failure_message` of custom matchers include text for helper methods
    # defined using `chain`, e.g.:
    # be_bigger_than(2).and_smaller_than(4).description
    #   # => "be bigger than 2 and smaller than 4"
    # ...rather than:
    #   # => "be bigger than 2"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

  config.raise_errors_for_deprecations!
end
