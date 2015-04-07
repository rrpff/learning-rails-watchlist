class CreateWatcheds < ActiveRecord::Migration
  def change
    create_table :watcheds do |t|
      t.references :watchable, polymorphic: true
      t.references :user

      t.timestamps null: false
    end
  end
end
