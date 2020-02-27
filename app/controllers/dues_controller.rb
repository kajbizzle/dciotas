class DuesController < ApplicationController
  before_action :authenticate_user!

  def index
    @dues = Due.all
  end

  def new
    @due = Due.new
  end

  def create
    @due = current_user.dues.create(course_params)
  end

  def show
    @due = Due.find(params[:id])
  end

  private

  def due_params
    params.require(:due).permit(:description, :title, :amount, :status)
  end
end
