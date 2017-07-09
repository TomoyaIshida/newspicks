class ReadsController < ApplicationController

  def index
    @reads = current_user.reads.order("updated_at DESC")
  end

  def create
    @read = Read.new(read_params)
    if @read.save
      redirect_to root_path
    end
  end

  def destroy
    read = Read.find(params[:id])
    if read.user_id == current_user.id
      read.destroy
      redirect_to reads_path
    end
  end

  private
  def read_params
    params.require(:read).permit(:article_id).merge(user_id: current_user.id)
  end
end
