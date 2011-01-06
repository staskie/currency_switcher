require 'nokogiri'
require 'open-uri'

$:.unshift(File.join(File.dirname(__FILE__), 'currency_switcher'))

require 'currencies'
require 'ext/fixnum'

module CurrencySwitcher

  # URL for working out the exchange rate
  URL = "http://exchange-rates.org/converter"
  
  class << self
    # Get 'from' currency
    #
    # Returns the Symbol of 'from' currency
    attr_reader :from_currency
    
    # Get 'to' currency
    #
    # Returns the Symbol of 'to' currency
    attr_reader :to_currency
  end
  
  # Validates if a method called on Fixnum is a currency
  # exchange method
  #
  # method - The String representing the method's name
  #
  # Examples
  #
  #   CurrencySwitcher.valid_exchange_method?(usd_to_eur)
  #   # => true
  #
  #   CurrencySwitcher.valid_exchange_method?(usd_to_fakecurrency)
  #   # => false
  #
  # Returns true if a method is valid or false if the method is invalid
  def self.valid_exchange_method?(method)
    if method =~ /(.+)_to_(.+)/
      @from_currency = $1.to_sym
      @to_currency   = $2.to_sym
      @method        = method
      
      both_currencies_valid? ? true : false
    end
  end

  # Check if 'from' and 'to' currencies are valid. They have to be defined
  # in CURRENCIES hash
  #
  # Returns true if botch currencies are valid or false if one of them is invalid
  def self.both_currencies_valid?
    CURRENCIES.has_key?(from_currency) && CURRENCIES.has_key?(to_currency)
  end
  
  
  # Calculate the value from fixnum and exchange rate
  #
  # fixnum - The Fixnum representing how much should be converted
  #
  # Examples
  #
  #   CurrencySwitcher.calculate_value(3)
  #   # => 5.23
  #
  # Returns float value of fixnum multiplied by exchange rate
  # Raises StandardError if exchange rate is nil
  def self.calculate_value(fixnum)
    ex_rate = exchange_rate
    raise StandardError, "Could not work out the result" if ex_rate.nil?
    
    value = "%.2f" % (ex_rate * fixnum)
    value.to_f
  end
  
  # Work out the exchange rate for a given URL. 
  # Parse the response and extract the value
  #
  # Returns the Float value of exchange rate or nil
  def self.exchange_rate
    doc = Nokogiri::HTML(open(self.link), nil, 'UTF-8')
    doc.css('#ctl00_M_lblToAmount').text.to_f
  rescue 
  end
  
  # Create a customized URL for 'from' and 'to' currencies
  #
  # Returns the String representing a valid URL
  def self.link
    "#{URL}/#{from_currency.to_s.upcase}/#{to_currency.to_s.upcase}/1"
  end
  
  # Print the available list of currencies
  #
  # Returns the String with all the currencies
  def self.currencies
    CURRENCIES.keys.sort.each { |symbol| puts "#{symbol} => #{CURRENCIES[symbol]}"}
  end
end
