module ActivityHelper

  def display_weblink link
    icon_id, url = if link.is_a?(Document)
                     ["icon-pdf", link.document.url]
                   else
                     case link.label.downcase.strip
                     when "facebook"
                       ["icon-rrss-facebook", link.url]
                     when "twitter"
                       ["icon-rrss-twitter", "https://twitter.com/#{link.url}"]
                     else
                       ["icon-rrss_web", link.url]
                     end
                   end
    content_tag :li do
      link_to url, target: "_blank" do
        content_tag(:svg, content_tag(:use, "", {"xlink:href": "##{icon_id}"}),
          class: "icon") +
        content_tag(:span, link.label, class: "text")
      end
    end
  end
end
