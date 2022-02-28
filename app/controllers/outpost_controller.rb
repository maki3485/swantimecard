class OutpostController < ApplicationController
  before_action :authenticate_user, {only: [:show, :out]}
  def out
    @outs = Outpost.all.order(created_at: :asc)
  end
  def show
    @out = Outpost.find_by(id: params[:id])
  end
  def new

  end
  def create
    @out = Outpost.new(content: params[:content])
    if @out.save
      flash[:notice] = "退勤しました"
      redirect_to("/")
    else
      flash[:notice] = "エラー：情報が入っていません"
      render("outpost/new")
    end
  end

  def destroy
    @out = Outpost.find_by(id: params[:id])
    @out.destroy
    flash[:notice] = "データを削除しました"
    redirect_to("/outpost/out")
  end
end
