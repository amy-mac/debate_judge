class CreateRounds < ActiveRecord::Migration
  def change
    create_table :rounds do |t|
      t.integer :round_num
      t.string :event
      t.integer :tournament_id
      t.timestamps
    end
  end
end
