class Admin::CategoriesController < ApplicationController

  def index
  end

  def new
  end

  def create
  end

  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
