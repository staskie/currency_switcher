require 'helper'

class TestCurrencySwitcher < Test::Unit::TestCase
  
  def setup
    FakeWeb.register_uri(:get, 'http://exchange-rates.org/converter/EUR/USD/1', :body => mock_eur_to_usd)
    FakeWeb.register_uri(:get, 'http://exchange-rates.org/converter/USD/GBP/1', :body => mock_usd_to_gbp)
  end
  
  def test_method_missing
    assert_raise(NoMethodError) { 2.fake_method }
  end
  
  def test_usd_to_not_defined_currency
    assert_raise(NoMethodError) { 2.usd_to_fakemethod }
  end
  
  def test_not_defined_currency_to_usd
    assert_raise(NoMethodError) { 2.fakemethod_to_usd }
  end
  
  def test_usd_to_euro_valid_method
    assert_nothing_raised(NoMethodError) { 2.eur_to_usd }
  end
  
  def test_link_for_usd_and_gbp
    CurrencySwitcher.stubs(:from_currency).returns(:usd)
    CurrencySwitcher.stubs(:to_currency).returns(:gbp)
    assert_equal("http://exchange-rates.org/converter/USD/GBP/1", CurrencySwitcher.link)
  end
  
  def test_link_for_eur_and_usd
    CurrencySwitcher.stubs(:from_currency).returns(:eur)
    CurrencySwitcher.stubs(:to_currency).returns(:usd)
    assert_equal("http://exchange-rates.org/converter/EUR/USD/1", CurrencySwitcher.link)    
  end
  
  def test_exchange_rate
    CurrencySwitcher.stubs(:from_currency).returns(:usd)
    CurrencySwitcher.stubs(:to_currency).returns(:gbp)

    assert_equal(0.64539, CurrencySwitcher.exchange_rate)
  end
  
  def test_usd_to_gbp
    assert_equal(format(2, 0.64539), 2.usd_to_gbp)
  end
  
  def test_eur_to_usd
    assert_equal(format(3, 1.3171), 3.eur_to_usd)
  end
  
  def test_exchange_rate_error
    Nokogiri.stubs(:HTML).returns(nil)
    assert_raise(StandardError) { 2.eur_to_usd }
  end
  
  def test_listing_currencies
    out = output { CurrencySwitcher.currencies }
    assert_match(/eur => Euro/, out)
  end
  
  private 
  
  def format(fixnum, rate)
    ("%.2f" % (fixnum * rate)).to_f
  end
end