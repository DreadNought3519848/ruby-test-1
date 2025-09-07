class PostsController < ApplicationController
    validates :name, presence: true
    validates :content, presence: ture, length: { maximum: 200 }
    def index
        @posts = Post.all.order(created_at: :desc)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to root_path, notice: "投稿しました!"
        eles
          render :new
        end
    end

private

  def post_params
      params.require(:post).permit(:name, :content)
  end
end
