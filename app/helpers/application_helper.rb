# frozen_string_literal: true
module ApplicationHelper
  def related_media_card index, media, &block
    data = {}
    data["link"] = resource_path(media)
    classes = ["c-related-media-item"]

    if ![MediaContent::TYPE_VIDEO, MediaContent::TYPE_VIDEO_COLLECTION].include?(media.type)
      biggest = media.first_item.biggest_size
      picture_url = biggest.url
      classes << "-vertical" if biggest.is_vertical?
      styles = "background-image: url('#{biggest.url}')"
    else
      classes << "js-video-thumbnail"
      data["video-provider"] = media.video_provider
      data["video-id"] = media.video_id
    end

    content_tag :div, id: index, class: classes.join(" "),
      data: data, style: styles do
      yield
    end
  end

  def resource_users resource
    user_ids = [0]

    if resource.publications.any?
      resource.publications.each do |item|
        item.users.each do |user|
          user_ids.push(user.id)
        end
      end
    end

    if resource.activities.any?
      resource.activities.each do |item|
        item.users.each do |user|
          user_ids.push(user.id)
        end
      end
    end

    user_ids = user_ids.uniq

    User.where(id: user_ids).order_by_fullname
  end
end
