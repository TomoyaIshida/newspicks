class RelationshipsController < ApplicationController

  def create
    relationship = Relationship.create(create_params)
    redirect_id = relationship.following_id
    redirect_to user_path(redirect_id)
  end

  def destroy
    relationship =  Relationship.find(params[:id])
    redirect_id = relationship.following_id
    relationship.destroy
    redirect_to user_path(redirect_id)
  end

  private

  def create_params
    params.permit(:following_id).merge(follower_id: current_user.id)
  end
end
