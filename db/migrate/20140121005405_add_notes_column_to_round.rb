class AddNotesColumnToRound < ActiveRecord::Migration
  def change
    add_column :rounds, :notes, :string
  end
end
