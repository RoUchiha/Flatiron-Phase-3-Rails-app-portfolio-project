class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.string :genre 
      t.integer :episodes
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
