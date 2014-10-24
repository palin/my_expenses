class AddGenderEmailToUser < ActiveRecord::Migration
  def change
    add_column :users, :gender, :string
    add_column :users, :email, :string
  end
end
