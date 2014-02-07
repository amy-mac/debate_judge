class AddIndexToContentions < ActiveRecord::Migration
  def change
    add_index :contentions, :round_id
  end
end
