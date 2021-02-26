module Api
  module V1
    class IdeasController < ApplicationController
      # before_action :set_idea, only: :show

      # def index
      #   @ideas = Idea.all
      #   render json: { data: @ideas }
      # end

      # def show
      #   render json: { data: @idea }
      # end

      # def create
      #   @idea = Idea.new(idea_params)
      #   if @idea.save
      #     render json: { status: 201 }
      #   else
      #     render json: { status: 422 }
      #   end
      # end

      # private

      # def set_idea
      #   @idea = Idea.find(params[:id])
      # end

      # def idea_params
      #   # params.require(:idea).permit(:category_name, :body)
      #   params.permit(
      #     :id,
      #     :category_id,
      #     :body
      #   )
      # end
      def index
        ideas = Category.joins(:ideas).select('ideas.id, name As category, body')
        render json: { data: ideas }
      end
    end
  end
end