class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.integer :tmdb_id
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.string :rating

      t.timestamps null: false
    end
  end
end
