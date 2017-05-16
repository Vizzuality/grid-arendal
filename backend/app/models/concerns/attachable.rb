# frozen_string_literal: true
module Attachable
  module Picture
    extend ActiveSupport::Concern

    included do
      if ENV['AWS_ACCESS_KEY_ID'].present?
        has_attached_file :picture,
                          styles: { medium: '500x500>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :s3,
                          s3_credentials: {
                            bucket: ENV['S3_BUCKET_NAME'],
                            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                            s3_region: ENV['AWS_REGION'],
                          },
                          url: ':s3_domain_url',
                          path: "#{Rails.env}/:class/:s_picture/:id/:style/:basename.:extension",
                          :s3_protocol => ''
      else
        has_attached_file :picture, styles: { medium: '500x500>', thumb: '100x100>' },
                                    default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :picture, content_type: /\Aimage/
      validates_attachment_file_name :picture, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]

    end
  end

  module CoverPicture
    extend ActiveSupport::Concern

    included do
      if ENV['AWS_ACCESS_KEY_ID'].present?
        has_attached_file :cover_picture,
                          styles: { medium: '500x500>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :s3,
                          s3_credentials: {
                            bucket: ENV['S3_BUCKET_NAME'],
                            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                            s3_region: ENV['AWS_REGION'],
                          },
                          url: ':s3_domain_url',
                          path: "#{Rails.env}/:class/:s_cover_picture/:id/:style/:basename.:extension",
                          :s3_protocol => ''
      else
        has_attached_file :cover_picture, styles: { medium: '500x500>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :cover_picture, content_type: /\Aimage/
      validates_attachment_file_name :cover_picture, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module Logo
    extend ActiveSupport::Concern

    included do
      if ENV['AWS_ACCESS_KEY_ID'].present?
        has_attached_file :logo,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :s3,
                          s3_credentials: {
                            bucket: ENV['S3_BUCKET_NAME'],
                            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                            s3_region: ENV['AWS_REGION'],
                          },
                          url: ':s3_domain_url',
                          path: "#{Rails.env}/:class/:s_logo/:id/:style/:basename.:extension",
                          :s3_protocol => ''
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
      if ENV['AWS_ACCESS_KEY_ID'].present?
        has_attached_file :background_image,
                          styles: { medium: '500x500>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :s3,
                          s3_credentials: {
                            bucket: ENV['S3_BUCKET_NAME'],
                            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                            s3_region: ENV['AWS_REGION'],
                          },
                          url: ':s3_domain_url',
                          path: "#{Rails.env}/:class/:s_background_image/:id/:style/:basename.:extension",
                          :s3_protocol => ''
      else
        has_attached_file :background_image, styles: { medium: '500x500>', thumb: '100x100>' },
                                             default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :background_image, content_type: /\Aimage/
      validates_attachment_file_name :background_image, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]
    end
  end

  module Avatar
    extend ActiveSupport::Concern

    included do
      if ENV['AWS_ACCESS_KEY_ID'].present?
        has_attached_file :avatar,
                          styles: { medium: '300x300>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :s3,
                          s3_credentials: {
                            bucket: ENV['S3_BUCKET_NAME'],
                            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                            s3_region: ENV['AWS_REGION'],
                          },
                          url: ':s3_domain_url',
                          path: "#{Rails.env}/:class/:s_avatar/:id/:style/:basename.:extension",
                          :s3_protocol => ''
      else
        has_attached_file :avatar, styles: { medium: '300x300>', thumb: '100x100>' },
                                    default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :avatar, content_type: /\Aimage/
      validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]

      before_save :destroy_avatar?

      def avatar_delete
        @avatar_delete ||= "0"
      end

      def avatar_delete=(value)
        @avatar_delete = value
      end

      private
      def destroy_avatar?
        self.avatar.clear if @avatar_delete == "1"
      end
    end
  end

  module Thumbnail
    extend ActiveSupport::Concern

    included do
      if ENV['AWS_ACCESS_KEY_ID'].present?
        has_attached_file :thumbnail,
                          styles: { medium: '500x500>', thumb: '100x100>' },
                          default_url: '/assets/:style/missing2.png',
                          storage: :s3,
                          s3_credentials: {
                            bucket: ENV['S3_BUCKET_NAME'],
                            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                            s3_region: ENV['AWS_REGION'],
                          },
                          url: ':s3_domain_url',
                          path: "#{Rails.env}/:class/:s_thumbnail/:id/:style/:basename.:extension",
                          :s3_protocol => ''
      else
        has_attached_file :thumbnail, styles: { medium: '500x500>', thumb: '100x100>' },
                                   default_url: '/assets/:style/missing2.png'
      end

      validates_attachment_content_type :thumbnail, content_type: /\Aimage/
      validates_attachment_file_name :thumbnail, matches: [/png\Z/, /jpe?g\Z/,/gif\Z/,/PNG\Z/, /JPE?G\Z/,/GIF\Z/]

      before_save :destroy_thumbnail?

      def thumbnail_delete
        @thumbnail_delete ||= "0"
      end

      def thumbnail_delete=(value)
        @thumbnail_delete = value
      end

      private
      def destroy_thumbnail?
        self.thumbnail.clear if @thumbnail_delete == "1"
      end
    end
  end

  module Document
    extend ActiveSupport::Concern

    included do
      if ENV['AWS_ACCESS_KEY_ID'].present?
        has_attached_file :document,
                          storage: :s3,
                          s3_credentials: {
                            bucket: ENV['S3_BUCKET_NAME'],
                            access_key_id: ENV['AWS_ACCESS_KEY_ID'],
                            secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
                            s3_region: ENV['AWS_REGION'],
                          },
                          url: ':s3_domain_url',
                          path: "#{Rails.env}/:class/:s_document/:id/:style/:basename.:extension",
                          :s3_protocol => ''
      else
        has_attached_file :document
      end

      validates_attachment_content_type :document,
        content_type: ['application/pdf', 'application/postscript']
    end
  end
end
