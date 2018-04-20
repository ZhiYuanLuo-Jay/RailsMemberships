class GroupsController < ApplicationController
  def index
    @group = Group.find(params[:id])
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      @group.save
      Membership.create(user_id: current_user.id, group_id: Group.last.id)
    else
      flash[:errors] = @group.errors.full_messages 
    end 
    redirect_to "/groups"
  end

  def show
    @groups = Group.all
  end

  def delete
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to "/groups"
  end 

  private
  
  def group_params
    params.require(:group).permit(:name, :description)
  end

end
