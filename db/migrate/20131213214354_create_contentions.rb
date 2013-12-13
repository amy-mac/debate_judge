class CreateContentions < ActiveRecord::Migration
  def change
    create_table :contentions do |t|
      t.string :speech_type
      t.text :contention
      t.boolean :refuted, default: false
      t.integer :round_id
      t.timestamps
    end
  end
end
