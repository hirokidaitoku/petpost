class CreateMypets < ActiveRecord::Migration[5.2]
  def change
    create_table :mypets do |t|
      t.string :petname
      t.string :description
      t.integer :age
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
