class WorksController < ApplicationController

  before_action :authenticate_user!, except: [:show, :index]
  after_action :verify_authorized, except: [:show, :index]

  def index
    @works = Work.order(:created_at).reverse_order.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
    authorize @work
  end

  def edit
    @work = Work.find(params[:id])
    authorize @work
    if current_user.admin? & (current_user != @work.user)
      true
    elsif current_user.editor? & (current_user == @work.user)
      true
    elsif current_user != @work.user
      redirect_to(@work, notice: 'У вас нет доступа')
    end
  end

  def create
    @work = current_user.works.new work_params
    authorize @work
    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Все получилось!' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    work = Work.find_by({id: params[:id]})
    authorize work
    if work.update!(work_params)
      redirect_to work
    else
      render json: { error: 'Нет доступа' }, status: :not_found
    end
  end

  def destroy
    work = Work.find_by({id: params[:id]})
    work.destroy
    authorize work
    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Успешно!' }
      format.json { head :no_content }
    end
  end

  private

    def work_params
      params.require(:work).permit(:user, :title, :content)
    end

end
