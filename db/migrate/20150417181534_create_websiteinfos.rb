class CreateWebsiteinfos < ActiveRecord::Migration
  def change
    create_table :websiteinfos do |t|
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
