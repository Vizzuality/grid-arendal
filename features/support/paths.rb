# frozen_string_literal: true
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
    when /the admin\s?page/
      '/manage/'
    when /the login page/
      '/manage/account/login'
    when /the logout page/
      '/manage/account/logout'
    when /the register page/
      '/manage/account/register'
    when /the account edit page for "(.*)"$/
      backend.edit_user_account_path(User.find_by_email($1).id)
    when /the users page/
      backend.users_path
    when /the new user page/
      backend.new_user_path
    when /the user page for "(.*)"$/
      backend.user_path(User.find_by_email($1).id)
    when /the edit user page for "(.*)"$/
      backend.edit_user_path(User.find_by_email($1).id)
    when /the partners page/
      backend.partners_path
    when /the new partner page/
      backend.new_partner_path
    when /the partner page for "(.*)"$/
      backend.partner_path(Partner.find_by_name($1).id)
    when /the edit partner page for "(.*)"$/
      backend.edit_partner_path(Partner.find_by_name($1).id)
    when /the about_sections page/
      backend.about_sections_path
    when /the new about_section page/
      backend.new_about_section_path
    when /the edit about_section page for "(.*)"$/
      backend.edit_about_section_path(AboutSection.find_by_title($1).id)
    when /the events page/
      backend.events_path
    when /the new event page/
      backend.new_event_path
    when /the event page for "(.*)"$/
      backend.event_path(Event.find_by_title($1).id)
    when /the edit event page for "(.*)"$/
      backend.edit_event_path(Event.find_by_title($1).id)
    when /the news_articles page/
      backend.news_articles_path
    when /the new news_article page/
      backend.new_news_article_path
    when /the edit news_article page for "(.*)"$/
      backend.edit_news_article_path(NewsArticle.find_by_title($1).id)
    when /the events page/
      backend.events_path
    when /the new event page/
      backend.new_event_path
    when /the event page for "(.*)"$/
      backend.event_path(Event.find_by_title($1).id)
    when /the edit event page for "(.*)"$/
      backend.edit_event_path(Event.find_by_title($1).id)
    else
      if path = match_rails_path_for(page_name)
        path
      else
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in features/support/paths.rb"
      end
    end
  end

  def match_rails_path_for(page_name)
    if page_name.match(/the (.*) page/)
      return send "#{$1.gsub(" ", "_")}_path" rescue nil
    end
  end
end

World(NavigationHelpers)
