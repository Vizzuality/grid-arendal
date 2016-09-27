class AddAttachmentPictureToContents < ActiveRecord::Migration
  def self.up
    change_table :contents do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :contents, :picture
  end
end
