class AddColumnRefutedByToContention < ActiveRecord::Migration
  def change
    add_column :contentions, :refuted_by, :string
  end
end
