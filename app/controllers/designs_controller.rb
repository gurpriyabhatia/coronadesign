class DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_design, only: [:show, :edit, :update, :destroy]

  def index
    @designs = Design.all.order("created_at DESC")
  end

  def show
  end

  def new
    @design = current_user.designs.build
  end

  def create
    @design = current_user.designs.build(design_params)

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
    params.require(:design).permit(:title, :source, :description, :photo)
  end

  def find_design
    @design = Design.find(params[:id])
  end
end
