class AddPriceToExpenses < ActiveRecord::Migration
  def change
    add_column :expenses, :price, :decimal
  end
end
