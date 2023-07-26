require_relative '../../.cloudinary_key.rb';

Cloudinary.config do |config|
    config.cloud_name = $cloudinary_cloud_name
    config.api_key = $cloudinary_api_key
    config.api_secret = $cloudinary_api_secret
    config.secure = true
    config.cdn_subdomain = true
   end