class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :user
      t.integer :stars
      t.text :comment

      t.timestamps
    end
  end
end
