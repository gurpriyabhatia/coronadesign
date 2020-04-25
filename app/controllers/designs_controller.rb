class DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  # skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: [:index, :show]
  before_action :find_design, only: [:show, :edit, :update, :destroy]
  # before_action :auth_design, only: [:new, :create, :edit, :update, :destroy]

  def index
    @designs = policy_scope(Design).order("created_at DESC")
  end

  def show
    #authorize @design
  end

  def new
    @design = current_user.designs.build
    authorize(@design)
  end

  def create
    @design = current_user.designs.build(design_params)
    @design.user = current_user
    authorize(@design)

    if @design.save!
      redirect_to @design, notice: "Sucessfully added new design"
    else
      render :new
    end
  end

  def edit
    authorize(@design)
  end

  def update
    authorize(@design)
    if @design.update(design_params)
      redirect_to @design, notice: "Design was successfully updated!"
    else
      render 'edit'
    end
  end

  def destroy
    authorize(@design)
    @design.destroy
    redirect_to designs_path, notice: "Design was successfully deleted!"
  end

  private

  def design_params
    params.require(:design).permit(:title, :source, :description, :photo)
  end

  # def auth_design
  #   authorize @design
  # end

  def find_design
    @design = Design.find(params[:id])
    # authorize @design
  end
end
