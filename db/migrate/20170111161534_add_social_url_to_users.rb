class AddSocialUrlToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :video_id, :integer
    add_column :users, :facebook_url, :string
    add_column :users, :linkedin_url, :string
    add_column :users, :twitter_url, :string
    add_column :users, :google_url, :string
  end
end
