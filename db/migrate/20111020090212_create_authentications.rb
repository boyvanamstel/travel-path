class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :provider
      t.string :token
      t.string :secret
      t.string :scope
      t.integer :user_id

      t.timestamps
    end
  end
end
