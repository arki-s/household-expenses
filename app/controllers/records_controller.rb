class RecordsController < ApplicationController
  def index
    @user = current_user
    @records = current_user.records

  end

  def show
    @user = current_user
    @record = Record.find(params[:id])

  end

  def new
    @record = Record.new
  end

  def create
    @user = current_user
    @record = Record.new(record_params)
    @record.user = @user
    if @record.save
      redirect_to budgets_path
    else
      render :new, status: :unprocessable_entity
    end


  end

  def edit

  end

  def update

  end

  def destroy

  end

  def calendar
    @user = current_user
    start_date = params.fetch(:start_time, Date.today).to_date
    @meetings = Meeting.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  private

  def record_params
    params.require(:record).permit(:date, :amounts)
  end
end
