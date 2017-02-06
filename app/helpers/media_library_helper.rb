module MediaLibraryHelper

  def graphic_formats_download graphic
    links = []
    if graphic.eps
      links << content_tag(:li, "eps", class: "btn -dark")
    end
    if graphic.pdf
      links << content_tag(:li, "pdf", class: "btn -dark")
    end
    return nil if links.empty?
    content_tag :ul, class: "button-list" do
      links.map do |link|
        concat(link)
      end
    end
  end
end
