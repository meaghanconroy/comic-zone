class AvatarUploader < CarrierWave::Uploader::Base
  if Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
  def default_url(*)
    ActionController::Base.helpers.asset_path(
      [version_name, "default.jpg"].compact.join('_'))
  end
end
