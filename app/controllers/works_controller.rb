class WorksController < ApplicationController

  before_action :set_work, only: [:show, :edit, :update, :destroy]

  def index
    @works = Work.order(:created_at).reverse_order.all
  end

  def show

  end

  def new
    @work = Work.new
  end

  def edit

  end

  def create
    @work = current_user.works.new(work_params)

    # @work.user_id = @current_user.id
    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Vacancy was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @work.update work_params
      redirect_to @work
    else
      render json: @work.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Request was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_work
      @work = Work.find(params[:id])
    end

    def work_params
      params.require(:work).permit(:user_id, :title, :content)
    end

end
