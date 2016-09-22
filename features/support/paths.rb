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
      backend.edit_user_registration_path(User.find_by_email($1).id)
    when /the users page/
      backend.users_path
    when /the user page for "(.*)"$/
      backend.user_path(User.find_by_email($1).id)
    when /the edit user page for "(.*)"$/
      backend.edit_user_path(User.find_by_email($1).id)
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
