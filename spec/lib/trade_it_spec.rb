require 'spec_helper'

describe TradeIt do
  it 'has a version number' do
    expect(TradeIt::VERSION).not_to be nil
  end

  it 'returns brokers' do
    expect(TradeIt.brokers[:td]).to eq('TD')
  end

  describe '#api_uri' do
    it 'returns ENV - TRADEIT_BASE_URI' do
      expect(TradeIt.api_uri).to eql ENV['TRADEIT_BASE_URI']
    end
    it 'raises error when not configured' do
      TradeIt.configure do |config|
        config.api_uri = nil
      end
      expect { TradeIt.api_uri }.to raise_error(Trading::Errors::ConfigException)
    end
  end
  describe '#api_key' do
    it 'returns ENV - TRADEIT_API_KEY' do
      expect(TradeIt.api_key).to eql ENV['TRADEIT_API_KEY']
    end
    it 'raises error with no key' do
      TradeIt.configure do |config|
        config.api_key = nil
      end
      expect { TradeIt.api_uri }.to raise_error(Trading::Errors::ConfigException)
    end
  end
  describe '#price_service_url' do
    it 'returns ENV - PRICE_SERVICE_URL' do
      expect(TradeIt.price_service_url).to eql ENV['PRICE_SERVICE_URL']
    end
    it 'raises error with no key' do
      TradeIt.configure do |config|
        config.price_service_url = nil
      end
      expect { TradeIt.price_service_url }.to raise_error(Trading::Errors::ConfigException)
    end
  end

end
