class CreateHashTags < ActiveRecord::Migration[7.1]
  def change
    create_table :hash_tags do |t|
      t.references :quote, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end
  end
end
