class ReadsController < ApplicationController

  def create
    @read = Read.new(read_params)
    if @read.save
      redirect_to root_path
    end
  end

  # def destroy
  # end

  def show
    @reads = current_user.reads.order("updated_at DESC")
  end

  private
  def read_params
    params.require(:read).permit(:article_id).merge(user_id: current_user.id)
  end
end
