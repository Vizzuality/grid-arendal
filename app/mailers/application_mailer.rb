# frozen_string_literal: true
class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@#{ENV['APP_HOST']}"
  layout 'mailer'
end
