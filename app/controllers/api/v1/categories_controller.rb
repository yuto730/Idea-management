module Api
  module V1
    class CategoriesController < ApplicationController
      # before_action :set_category, only: :show

      # def index
      #   @categories = Category.all
      #   render json: { data: @categories }
      # end

      # def show
      #   render json: { data: @category }
      # end

      # def create
      #   @category = Category.new(category_params)
      #   if @category.save
      #     render json: { status: 201 }
      #   else
      #     render json: { status: 422 }
      #   end
      # end

      # private

      # def set_category
      #   @category = Category.find(params[:id])
      # end

      # def category_params
      #   # params.require(:category).permit(:name)
      #   params.permit(
      #     :name
      #   )
      # end
    end
  end
end
