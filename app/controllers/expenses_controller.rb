class ExpensesController < ApplicationController

  before_filter :require_logged_user

  def index
  end

  def new
    @expense = Expense.new
  end

  def create
    current_user.expenses.create(expense_params)

    redirect_to new_expense_path
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :payed_at, :user_id)
  end

  def require_logged_user
    redirect_to root_path, alert: "You have to be logged in to see this page!" and return unless current_user.present?
  end
end
