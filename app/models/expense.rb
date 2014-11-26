class Expense < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates_presence_of :name, :payed_at, :price, :user_id
end
