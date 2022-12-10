class CreateRecomendacoes < ActiveRecord::Migration[7.0]
  def change
    create_table :recomendacoes do |t|
      t.string :titulo
      t.string :artista
      t.text :desc
      t.string :img

      t.timestamps
    end
  end
end
