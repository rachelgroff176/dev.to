module Api
  module V0
    class CommentsController < ApiController
      # before_action :set_cache_control_headers, only: [:index, :show]
      caches_action :index,
                    cache_path: proc { |c| c.params.permit! },
                    expires_in: 10.minutes
      respond_to :json

      caches_action :show,
                    cache_path: proc { |c| c.params.permit! },
                    expires_in: 10.minutes
      respond_to :json

      def index
        @commentable = Article.find(params[:a_id])
        @commentable_type = "Article"
      end

      def show
        @comment = Comment.find(params[:id].to_i(26))
      end
    end
  end
end
