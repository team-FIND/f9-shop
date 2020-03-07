require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development? # 開発中もs3使う
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'f9-shop.jp.img'
    config.asset_host = 'https://s3.amazonaws.com/f9-shop.jp.img'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAZYWS7APLUNWK3GWW',
      aws_secret_access_key: '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',
      region: 'ap-northeast-1',
      # path_style: true
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end