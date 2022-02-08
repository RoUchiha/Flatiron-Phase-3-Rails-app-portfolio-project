class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.integer :show_id

      t.timestamps
    end
  end
end
