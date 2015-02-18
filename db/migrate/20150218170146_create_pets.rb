class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :kind
      t.integer :weight
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :pets, :users
  end
end
