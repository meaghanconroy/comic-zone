class AvatarUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
