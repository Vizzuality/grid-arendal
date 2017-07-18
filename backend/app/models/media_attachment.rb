# frozen_string_literal: true
# == Schema Information
#
# Table name: media_attachments
#
#  id                    :integer          not null, primary key
#  document_file_name    :string
#  document_content_type :string
#  document_file_size    :integer
#  document_updated_at   :datetime
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class MediaAttachment < ApplicationRecord
  include Attachable::Document
end
