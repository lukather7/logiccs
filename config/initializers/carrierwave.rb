CarrierWave.configure do |config|
  config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAJGYOBCJXDTN5VKAA',
      aws_secret_access_key: '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',
      region: 'ap-southeast-1'
  }
  
  case Rails.env
    when 'production'
      config.fog_directory = 'logiccsphotos'
      config.asset_host = 'https://s3-ap-southeast-1.amazonaws.com/logiccsphotos'
      
    when 'development'
      config.fog_directory = 'logiccsphotos'
      config.asset_host = 'https://s3-ap-southeast-1.amazonaws.com/logiccsphotos'  
      
     when 'test'
      config.fog_directory = 'logiccsphotos'
      config.asset_host = 'https://s3-ap-southeast-1.amazonaws.com/logiccsphotos'  
  end
end