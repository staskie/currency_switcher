class Numeric
  # Exchange a value using from and to currencies
  #
  # from - From currency
  # to   - To currency
  #
  # Example
  #
  #   5.exchange("gbp", "usd")
  #
  # Returns float value of currency exchange result
  # Raises StandardError if any currency is invalid
  # or could not work out the exchange rate
  def exchange(from, to)
      CurrencySwitcher.exchange(self, from, to)
  end
  
  # Overriding method_missing to add CurrencySwitcher methods
  #
  # sym - standard method_missing argument
  # *args - standard method_missing argument
  # &block - standard method_missing argument
  #
  # Examples
  #
  #   3.usd_to_eur
  #   1200.gbp_to_pln
  #
  # Returns Float value of currency exchange result
  # Raises NoMethodError if couldn't find a method
  def method_missing(sym, *args, &block)
    # Check if the missing method applies to CurrencySwitcher module
    if CurrencySwitcher.valid_exchange_method?(sym)
      return CurrencySwitcher.calculate_value(self)
    else
      super.method_missing(sym, *args, &block)
    end
  end
end