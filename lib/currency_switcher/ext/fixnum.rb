class Numeric
  def method_missing(sym, *args, &block)
    if CurrencySwitcher.valid_exchange_method?(sym)
      return CurrencySwitcher.calculate_value(self)
    else
      super.method_missing(sym, *args, &block)
    end
  end
end