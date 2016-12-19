# frozen_string_literal: true
module Attachable
  module Picture
    extend ActiveSupport::Concern

    included do
      if ENV['DROPBOX_APP_KEY'].present?
        has_attached_file :picture,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :dropbox,
                          dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                          dropbox_options: {
                            path: proc { |style| "#{Rails.env}/#{self.class.to_s}/#{style}/#{id}_#{picture.original_filename}"},
                            unique_filename: true
                          }
      else
        has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' },
                                    default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :picture, content_type: /\Aimage/
      validates_attachment_file_name :picture, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module CoverPicture
    extend ActiveSupport::Concern

    included do
      if ENV['DROPBOX_APP_KEY'].present?
        has_attached_file :cover_picture,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :dropbox,
                          dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                          dropbox_options: {
                            path: proc { |style| "#{Rails.env}/#{self.class.to_s}/#{style}/#{id}_#{cover_picture.original_filename}"},
                            unique_filename: true
                          }
      else
        has_attached_file :cover_picture, styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :cover_picture, content_type: /\Aimage/
      validates_attachment_file_name :cover_picture, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module Logo
    extend ActiveSupport::Concern

    included do
      if ENV['DROPBOX_APP_KEY'].present?
        has_attached_file :logo,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :dropbox,
                          dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                          dropbox_options: {
                            path: proc { |style| "#{Rails.env}/#{self.class.to_s}/#{style}/#{id}_#{logo.original_filename}"},
                            unique_filename: true
                          }
      else
        has_attached_file :logo, styles: { medium: '300x300>', thumb: '100x100>' },
                                 default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :logo, content_type: /\Aimage/
      validates_attachment_file_name :logo, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module BackgroundImage
    extend ActiveSupport::Concern

    included do
      if ENV['DROPBOX_APP_KEY'].present?
        has_attached_file :background_image,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :dropbox,
                          dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                          dropbox_options: {
                            path: proc { |style| "#{Rails.env}/#{self.class.to_s}/#{style}/#{id}_#{background_image.original_filename}"},
                            unique_filename: true
                          }
      else
        has_attached_file :background_image, styles: { medium: '300x300>', thumb: '100x100>' },
                                             default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :background_image, content_type: /\Aimage/
      validates_attachment_file_name :background_image, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module Avatar
    extend ActiveSupport::Concern

    included do
      if ENV['DROPBOX_APP_KEY'].present?
        has_attached_file :avatar,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :dropbox,
                          dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                          dropbox_options: {
                            path: proc { |style| "#{Rails.env}/#{self.class.to_s}/#{style}/#{id}_#{avatar.original_filename}"},
                            unique_filename: true
                          }
      else
        has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                                   default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :avatar, content_type: /\Aimage/
      validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module Thumbnail
    extend ActiveSupport::Concern

    included do
      if ENV['DROPBOX_APP_KEY'].present?
        has_attached_file :thumbnail,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :dropbox,
                          dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                          dropbox_options: {
                            path: proc { |style| "#{Rails.env}/#{self.class.to_s}/#{style}/#{id}_#{thumbnail.original_filename}"},
                            unique_filename: true
                          }
      else
        has_attached_file :thumbnail, styles: { medium: '300x300>', thumb: '100x100>' },
                                   default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :thumbnail, content_type: /\Aimage/
      validates_attachment_file_name :thumbnail, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module Document
    extend ActiveSupport::Concern

    included do
      if ENV['DROPBOX_APP_KEY'].present?
        has_attached_file :document,
                          storage: :dropbox,
                          dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                          dropbox_options: {
                            path: proc{ |style| "#{Rails.env}/documents/#{self.class.to_s}/#{id}_#{document.original_filename}"},
                            unique_filename: true
                          }
      else
        has_attached_file :document
      end

      validates_attachment_content_type :document,
        content_type: ['application/pdf', 'application/postscript']
    end
  end
end
