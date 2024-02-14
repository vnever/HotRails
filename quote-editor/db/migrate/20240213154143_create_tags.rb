class CreateTags < ActiveRecord::Migration[7.1]
  def change
    create_table :tags do |t|
      t.references :quote, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :tags, [:name, :quote_id], unique: true
    add_index :tags, :name
    
  end
end
