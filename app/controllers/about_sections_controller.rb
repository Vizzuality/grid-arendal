# frozen_string_literal: true
class AboutSectionsController < ApplicationController
  def index
    @sections = AboutSection.order(:title)
  end
end
