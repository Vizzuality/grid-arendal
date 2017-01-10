# frozen_string_literal: true
module Backend
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    before_action :set_nav_links

    layout 'backend/layouts/backend'

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, alert: exception.message
    end

    private

    def set_nav_links
      @links = [
        {name: "Activities", path: activities_path,
         key: "activities", count: Activity.count},
        {name: "Publications", path: publications_path,
          key: "publications", count: Publication.count},
        {name: "News", path: news_articles_path,
          key: "news_articles", count: NewsArticle.count},
        {name: "Media library", path: albums_path,
         key: "photos", count: MediaContent.wo_photos_in_album.count},
        {name: "Events", path: events_path,
          key: "events", count: Event.count},
        {name: "Partners", path: partners_path,
          key: "partners", count: Partner.count},
        {name: "Staff", path: users_path,
          key: "users", count: User.count},
        {name: "About Sections", path: about_sections_path,
          key: "about_sections", count: AboutSection.count},
        {name: "Content types", path: content_types_path,
          key: "content_types", count: ContentType.count},
        {name: "Tags", path: tags_path,
          key: "tags", count: Tag.count},
        {name: "Vacancies", path: vacancies_path,
          key: "vacancies", count: Vacancy.count},
        {name: "Sections", path: site_sections_path,
          key: "sections", count: SiteSection.count}
      ]
    end
  end
end
