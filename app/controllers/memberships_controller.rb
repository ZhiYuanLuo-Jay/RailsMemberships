class MembershipsController < ApplicationController
  def index
  end

  def create
    Membership.create(user_id: current_user.id, group_id: params[:id])
    redirect_to "/groups"
  end

  def destroy
    membership = Membership.find_by(group_id: params[:id].to_i, user_id: current_user.id)
    membership.destroy
    redirect_to "/groups"
  end
end
