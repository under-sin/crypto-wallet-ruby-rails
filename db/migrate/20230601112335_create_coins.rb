class CreateCoins < ActiveRecord::Migration[7.0]
  def change
    create_table :coins do |t|
      # por convenção o rails coloca o campo id
      t.string :description
      t.string :acronym
      t.string :url_image

      t.timestamps # adiciona o createdAt e UpdatedAt
    end
  end
end
