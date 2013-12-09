class CreateTournaments < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.string :tournament
      t.string :school
      t.date :date
      t.integer :user_id
      
      t.timestamps
    end
  end
end
