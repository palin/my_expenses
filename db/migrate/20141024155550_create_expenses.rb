class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string :name
      t.datetime :payed_at

      t.timestamps
    end
  end
end
