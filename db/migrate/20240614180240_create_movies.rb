class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :description
      t.integer :year
      t.string :director, array: true, default: []
      t.string :actors, array: true, default: []
      t.string :filming_locations, array: true, default: []
      t.string :country, array: true, default: []

      t.timestamps
    end

    add_index :movies, :actors, using: 'gin'
  end
end
