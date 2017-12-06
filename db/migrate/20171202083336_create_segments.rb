class CreateSegments < ActiveRecord::Migration[5.1]
  def change
    create_table :segments do |t|
      t.string :name
      t.references :exam, foreign_key: true

      t.timestamps
    end
  end
end
