class ExpensesController < ApplicationController

  before_filter :require_logged_user

  def index
    @expenses = current_user.expenses
  end

  def new
    @expense = Expense.new
  end

  def create
    if current_user.expenses.create(expense_params)
      redirect_to new_expense_path
    else
      render :new
    end
  end

  def edit
    @expense = find_expense_object
  end

  def update
    @expense = find_expense_object
    @expense.update_attributes(expense_params)

    redirect_to expenses_path, notice: "Expense updated!"
  end

  def destroy
    @expense = find_expense_object
    @expense.delete if @expense

    redirect_to expenses_path, notice: "Expense deleted!"
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :payed_at, :price, :category_id, :description)
  end

  def find_expense_object
    Expense.find_by(id: params[:id])
  end

  def require_logged_user
    redirect_to root_path, alert: "You have to be logged in to see this page!" and return unless current_user.present?
  end
end
