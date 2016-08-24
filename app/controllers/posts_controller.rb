class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comment_users = []

    @user_array = []
    @post.comments.each do |comm|
      @user_array << comm.user
    end
    
    @final = @user_array.uniq {|obj| obj.id}






  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create


    post = Post.create(post_params)
    # unless params[:post][:category][:name] == ""
    #   cat = Category.create(name: params[:post][:category][:name])
    #   post.categories << cat
    # end
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name] )

  end
end
