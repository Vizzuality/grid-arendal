module MediaLibraryHelper
  def graphic_formats_download graphic
    links = []
    if graphic.eps
      links << content_tag(:li, "eps",
                           data: { attachment_id: graphic.eps_id, graphic_id: graphic.id },
                           class: "btn -dark js_download-graphic")
    end
    if graphic.pdf
      links << content_tag(:li, "pdf",
                           data: { attachment_id: graphic.pdf_id, graphic_id: graphic.id },
                           class: "btn -dark js_download-graphic")
    end
    return nil if links.empty?
    content_tag :ul, class: "button-list" do
      links.map do |link|
        concat(link)
      end
    end
  end

  def svg_icon_for media
    case media.type
      when MediaContent::TYPE_ALBUM
        "photo_library"
      when MediaContent::TYPE_PHOTO
        "photos"
      when MediaContent::TYPE_VIDEO_COLLECTION
        "video_library"
      when MediaContent::TYPE_VIDEO
        "videos"
      when MediaContent::TYPE_GRAPHIC
        "graphics"
      when MediaContent::TYPE_COLLECTION
        "collections"
    end
  end

  def author_title media_content
    case @media_content.type
      when MediaContent::TYPE_GRAPHIC
        "Cartographer"
      when MediaContent::TYPE_VIDEO
        "Produced by"
      when MediaContent::TYPE_PHOTO
        "Photographer"
      else
        "Taken by"
    end
  end
end
