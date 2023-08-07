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
    @budget = Budget.find(params[:budget_id])
  end

  def create
    @budget = Budget.find(params[:budget_id])
    @user = current_user
    @record = Record.new(record_params)
    @record.user = @user
    @record.budget = @budget
    if @record.save
      if @user.meetings.find_by(start_time: @record.start_time)
        meeting = @user.meetings.find_by(start_time: @record.start_time)
        meeting.amounts += @record.amounts
        meeting.update
      else
        @meeting = Meeting.new(amounts: @record.amounts, start_time: @record.start_time, end_time: @record.start_time)
        @meeting.user = @user
        @meeting.save
      end
      redirect_to budgets_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @record = Record.find(params[:id])
    @user = current_user
  end

  def update
    @record = record.find(params[:id])
    meeting = @user.meetings.find_by(start_time: @record.start_time)
    meeting.amounts -= @record.amounts
    if meeting.amounts.zero?
      meeting.destroy
    else
      meeting.update
    end
    if @record.update(record_params)
      if @user.meetings.find_by(start_time: @record.start_time)
        meeting = @user.meetings.find_by(start_time: @record.start_time)
        meeting.amounts += @record.amounts
        meeting.update
      else
        @meeting = Meeting.new(amounts: @record.amounts, start_time: @record.start_time, end_time: @record.start_time)
        @meeting.user = @user
        @meeting.save
      end
      redirect_to records_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @record = record.find(params[:id])
    date = Date.today
    if @user.meetings.find_by(start_time: date)
      meeting = @user.meetings.find_by(start_time: date)
      meeting.amounts -= @record.amounts
      meeting.update
    end
    @record.destroy
    redirect_to records_path, status: :see_other
  end

  def calendar
    @user = current_user
    start_date = params.fetch(:start_time, Date.today).to_date
    @meetings = Meeting.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end

  private

  def record_params
    params.require(:record).permit(:start_time, :amounts, :category_id)
  end
end
