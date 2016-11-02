# frozen_string_literal: true
# == Schema Information
#
# Table name: album_relations
#
#  id             :integer          not null, primary key
#  photoset_id    :integer
#  album_photo_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_album_relations_on_album_photo_id                  (album_photo_id)
#  index_album_relations_on_photoset_id                     (photoset_id)
#  index_album_relations_on_photoset_id_and_album_photo_id  (photoset_id,album_photo_id) UNIQUE
#

class AlbumRelation < ApplicationRecord
  belongs_to :photoset,    class_name: 'MediaContent', foreign_key: :photoset_id,    touch: true
  belongs_to :album_photo, class_name: 'MediaContent', foreign_key: :album_photo_id, touch: true
end
