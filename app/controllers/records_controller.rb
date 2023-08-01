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

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def record_params

  end

end
