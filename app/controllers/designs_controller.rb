class DesignsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @designs = Design.all
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  # private
end
