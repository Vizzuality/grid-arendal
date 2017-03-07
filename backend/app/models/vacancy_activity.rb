# frozen_string_literal: true
# == Schema Information
#
# Table name: vacancy_activities
#
#  id          :integer          not null, primary key
#  vacancy_id  :integer
#  activity_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class VacancyActivity < ApplicationRecord
  belongs_to :vacancy
  belongs_to :activity
end
