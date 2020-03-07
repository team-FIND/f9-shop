require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production? || Rails.env.development? # 開発中もs3使う
    config.storage :fog
    config.fog_provider = ''
    config.fog_directory  = ''
    config.asset_host = ''
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: '',
      aws_secret_access_key: '',
      region: '',
      # path_style: true
    }
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
end