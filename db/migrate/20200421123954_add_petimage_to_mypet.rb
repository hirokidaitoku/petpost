class AddPetimageToMypet < ActiveRecord::Migration[5.2]
  def change
    add_column :mypets, :petimage, :string
  end
end
