class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :avatar
      t.string :name
      t.string :uid
      t.string :username

      t.timestamps null: false
    end
  end
end