class PostsController < ApplicationController
  # before_action :find_post, except: [:create]
  # before_action :is_owner?, except: [:create, :show]
  # before_action :is_user?, except: [:show]

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to "/categories/#{@post.category_id}/posts/#{@post.id}"
    else
      @errors = @errors.post.full_messages
      render "/categories/#{@post.category_id}/posts/#{@post.id}"
    end
  end

  def show
    @post = Post.find(params[:post_id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @category = @post.category
  end

  def update
    @post = Post.find(params[:post_id])
    if @post.update_attributes(post_params)
      redirect_to "/categories/#{@post.category_id}/posts/#{@post.id}"
    else
      errors = @errors.post.full_messages
      render "/categories/#{@post.category_id}/posts/#{@post.id}/edit"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.destroy
    redirect_to "/categories/index"
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :price, :seller_id, :category_id)
  end
end
