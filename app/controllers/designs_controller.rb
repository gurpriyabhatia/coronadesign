class DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_design, only: [:show, :edit, :update, :destroy]

  def index
    @designs = Design.all.order("created_at DESC")
  end

  def show
  end

  def new
    @design = Design.new
  end

  def create
    @design = Design.new(design_params)

    if @design.save!
      redirect_to @design, notice: "Sucessfully added new design"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @design.update(design_params)
      redirect_to @design, notice: "Design was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    @design.destroy
    redirect_to designs_path
  end

  private

  def design_params
    params.require(:design).permit(:title, :source, :description)
  end

  def find_design
    @design = Design.find(params[:id])
  end
end
