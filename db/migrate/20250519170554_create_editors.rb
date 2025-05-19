class CreateEditors < ActiveRecord::Migration[8.0]
  def change
    create_table :editors do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
    add_index :editors, :email, unique: true
  end
end
