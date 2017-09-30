CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     'nothinghere', #env values remove since I dont have them
    aws_secret_access_key: 'nothinhereeaither',
    }
  config.fog_directory  = 'tailor'
end
