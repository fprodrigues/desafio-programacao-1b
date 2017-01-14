class CreateDados < ActiveRecord::Migration[5.0]
  def change
    create_table :dados do |t|
      t.string :comprador
      t.string :descricao
      t.float :preco
      t.integer :quantidade
      t.string :endereco
      t.string :fornecedor
      t.references :arquivo, foreign_key: true

      t.timestamps
    end
  end
end
