class PostsController < ApplicationController
  before_action :set_post_details, only: %i[new create edit update]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user).order(created_at: :desc).page(params[:page])
  end

  def show
    @post = Post.find(params[:id])
    @genre = @post.genre.name
    @partner = @post.partner.name
    @situation = @post.situation.name
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path, success: t('defaults.message.created', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_created', item: Post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to @post, success: t('defaults.message.updated', item: Post.model_name.human)
    else
      flash.now['danger'] = t('defaults.message.not_updated', item: Post.model_name.human)
      render :edit
    end
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy!
    redirect_to posts_path, success: t('defaults.message.deleted', item: Post.model_name.human)
  end

  private

  def set_post_details
    @genres = Genre.all
    @partners = Partner.all
    @situations = Situation.all
  end

  def post_params
    params.require(:post).permit(:word, :image, :episode, :partners_word, :genre_id, :partner_id, :situation_id, :name, :image_cache)
  end
end
