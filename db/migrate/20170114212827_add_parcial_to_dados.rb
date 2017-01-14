class AddParcialToDados < ActiveRecord::Migration[5.0]
  def change
    add_column :dados, :parcial, :float
  end
end
