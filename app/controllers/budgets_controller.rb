class BudgetsController < ApplicationController
  def index
    @user = current_user
    @budgets = current_user.budgets
  end

  def list
    @user = current_user
    @budgets = current_user.budgets
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @user = current_user
    @budget.user = @user
    if @budget.save
      redirect_to budgets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = current_user
    @budget = Budget.find(params[:id])
  end

  def edit
    @budget = Budget.find(params[:id])
    @user = User.find(@budget.user_id)
  end

  def update
    @budget = Budget.find(params[:id])
    @user = User.find(@budget.user_id)
    if @budget.update(budget_params)
      redirect_to budget_path(@budget)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

  end

  private

  def budget_params
    params.require(:budget).permit(:name, :start_time, :amounts, :end_time, :completed)
  end

end
