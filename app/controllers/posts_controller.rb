class PostsController < ApplicationController
  before_action :find_post, except: [:create]
  # before_action :is_owner?, except: [:create, :show]
  # before_action :is_user?, except: [:show]

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to category_post_path(@post.category, @post.id)
    else
      @errors = @errors.post.full_messages
      render category_post_path(@post.category, @post.id)
    end
  end

  def show
  end

  def edit
    @category = @post.category
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to category_post_path
    else
      errors = @errors.post.full_messages
      render edit_category_post_path
    end
  end

  def destroy
    @post.destroy
    redirect_to categories_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :price, :seller_id, :category_id)
  end
end
