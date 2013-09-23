class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.references :user, index: true
      t.string :provider
      t.string :uid
      t.hstore :credentials
      t.hstore :raw_info

      t.timestamps
    end
  end
end
