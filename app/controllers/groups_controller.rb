class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = Group.all
    @users = User.where.not(id: current_user.id)
  end

  def show
    @group = Group.find(params[:id])
    @messages = @group.messages
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      redirect_to group_path(@group), notice: "Successfully created new group"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    @new_group_details = @group.update(group_params)
    if @new_group_details.save
      redirect_to group_path(@new_group_details), notice: "Successfully updated group details"
    else
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    redirect_to groups_path, notice: "Successfully deleted group"
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
