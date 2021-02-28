module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_category, only: %i[show]

      def index
        @categories = Category.all
        render json: { data: @categories }
      end

      def create
        @category = Category.new(category_params)
        if @category.save
          render status: 201, json: { data: @category }
        else
          render status: 422, json: { data: @category.errors }
        end
      end

      def show
        if @category.find_by(name: params[:id]) != nil
          render json: { data: @category }
        else
          render status: :not_found, json: { status: 404 }
        end
      end

      private

      def set_category
        @category = Category.where(name: params[:id])
      end

      def category_params
        params.permit(:name)
      end
    end
  end
end
