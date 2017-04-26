module ContentHelper

  def background_image_url content, size=:original
    if content.picture.exists?
      content.picture.url(size)
    elsif content.media_content
      photo = if content.media_content.type == MediaContent::TYPE_PHOTO
                content.media_content
              else
                content.media_content.photos.first
              end
      photo.send(size == :original ? :biggest_size_url : :medium_or_small_url)
    else
      asset_path('original/missing2.png')
    end
  end
end
