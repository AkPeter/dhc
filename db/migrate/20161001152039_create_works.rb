class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|

      t.string :title
      t.text :content

      t.integer :user_id
      t.index :user_id

      t.timestamps null: false
    end
  end
end
