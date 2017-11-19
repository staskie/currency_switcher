require 'spec_helper'

describe CurrencySwitcher do
  before :all do
    FakeWeb.register_uri(:get, 'https://exchange-rates.org/converter/EUR/USD/1', :body => mock_eur_to_usd)
    FakeWeb.register_uri(:get, 'https://exchange-rates.org/converter/USD/GBP/1', :body => mock_usd_to_gbp)
  end

  context 'when exchanging USD to GBP' do
    describe '#exchange_rate' do
      it 'works out the exchange rate' do
        allow(CurrencySwitcher).to receive_messages(from_currency: :usd)
        allow(CurrencySwitcher).to receive_messages(to_currency: :gbp)

        expect(CurrencySwitcher.exchange_rate).to eq 0.64539
      end
    end

    describe 'dynamic method for conversion' do
      it 'works out the result' do
        expect(2.usd_to_gbp).to eq 1.29
      end
    end

    describe '#exchange_method' do
      it 'works out the result' do
        expect( 2.exchange('usd', 'gbp') ).to eq 1.29
      end
    end

    describe 'exceptions' do
      context 'when invalid currency is used' do
        it 'raises an exception' do
          expect { 2.exchange('usd', 'fake_currency') }.to raise_error(StandardError, 'To currency fake_currency is invalid')
        end
      end

      context 'when parsing goes wrong' do
        it 'raises an exception' do
          allow(Nokogiri).to receive_messages(:HTML => nil)
          expect { 2.eur_to_usd }.to raise_error(StandardError)
        end
      end

      context 'when number of arguments is incorrect' do
        it 'raises an exception' do
          expect { 2.exchange('usd') }.to raise_error(ArgumentError)
        end
      end

      context 'when dynamic method building is incorrectly used' do
        it 'raises an exception' do
          expect { 2.usd_to_something }.to raise_error(NoMethodError)
        end
      end

      context 'when an unknown method is called on integer' do
        it 'passes a method_missing to parent' do
          expect { 2.unknown_method }.to raise_error(NoMethodError)
        end
      end
    end
  end
end
