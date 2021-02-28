module Api
  module V1
    class IdeasController < ApplicationController
      before_action :set_idea, only: %i[show]

      def index
        @ideas = Category.joins(:ideas).select('ideas.id, name As category, body')
        render json: { data: @ideas }
      end

      def create
        category = Category.find(params[:category_id])
        @idea = category.ideas.create(idea_params)
        if @idea.save
          render status: 201, json: { data: @idea }
        else
          render status: 422, json: { data: @idea.errors }
        end
      end

      def show
        if @idea.find_by(name: params[:id]) != nil
          render json: { data: @idea }
        else
          render status: :not_found, json: { status: 404 }
        end
      end

      private

      def set_idea
        @idea = Category.joins(:ideas).select('ideas.id, name As category, body').where(name: params[:id])
      end

      def idea_params
        params.permit(:category_id, :body)
      end
    end
  end
end