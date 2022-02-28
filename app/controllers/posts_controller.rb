class PostsController < ApplicationController
  before_action :authenticate_user,{only: [:show, :index]}
  def index
    @posts = Post.all.order(created_at: :asc)
  end
  def show
    @post = Post.find_by(id: params[:id])
  end
  def new

  end
  def create
    @post = Post.new(content: params[:content])
    if @post.save
      flash[:notice] = "出勤しました"
      redirect_to("/outpost/new")
    else
      flash[:notice] = "エラー：情報が入っていません"
      render("posts/new")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "データを削除しました"
    redirect_to("/posts/index")
  end
end
