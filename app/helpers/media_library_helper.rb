module MediaLibraryHelper

  def graphic_formats_download graphic
    links = []
    if graphic.eps
      links << content_tag(:li, "eps",
                           data: { attachment_id: graphic.eps_id },
                           class: "btn -dark js_download-graphic")
    end
    if graphic.pdf
      links << content_tag(:li, "pdf",
                           data: { attachment_id: graphic.pdf_id },
                           class: "btn -dark js_download-graphic")
    end
    return nil if links.empty?
    content_tag :ul, class: "button-list" do
      links.map do |link|
        concat(link)
      end
    end
  end
end
