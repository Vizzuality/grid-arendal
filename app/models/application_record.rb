# frozen_string_literal: true
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    def get_filter_condition(params, search_field)
      where_condition = ''
      if params[:search].present? and params[:search] != ''
        where_condition = where_condition + " AND UPPER(#{search_field}) like UPPER(?)"
      end
      if params[:visibility_off].present?
        where_condition = where_condition + " AND is_published = false"
      end
      if params[:featured].present?
        where_condition = where_condition + " AND is_featured = true"
      end

      if where_condition == ''
        where_condition = nil
      else
        where_condition = '1 = 1' + where_condition
      end

      where_condition
    end
  end
end
