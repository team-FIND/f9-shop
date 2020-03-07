
unless Rails.env.development? || Rails.env.test?
    CarrierWave.configure do |config|
      config.fog_credentials = {
        provider: 'AWS',
        aws_access_key_id: 'AKIAZYWS7APLUNWK3GWW',
        aws_secret_access_key: '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',
        region: 'ap-northeast-1'
      }
  
      config.fog_directory  = 'f9-shop.jp.img'
      config.cache_storage = :fog
    end
  end