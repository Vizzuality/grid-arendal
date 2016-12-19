# frozen_string_literal: true
module Display
  extend ActiveSupport::Concern

  included do
    def display_name
      return "#{half_email}" if first_name.blank? && last_name.blank?
      return "#{first_name}" if last_name.blank?
      "#{first_name} #{last_name}"
    end

    def full_name
      return "#{email}"                   if email.present? && first_name.blank? && last_name.blank?
      return "#{first_name}"              if last_name.blank?
      return "#{last_name}"               if first_name.blank?
      "#{first_name} #{last_name}"
    end

    private

      def half_email
        return "" if email.blank?
        index = email.index('@')
        return "" if index.nil? || index.to_i.zero?
        email[0, index.to_i]
      end
  end

  class_methods do
  end
end
