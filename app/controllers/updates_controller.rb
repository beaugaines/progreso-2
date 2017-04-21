class UpdatesController < ApplicationController
  def index
  end

  def show
  end

  def create
    @project = Project.find(params[:project_id])
    @update = @project.updates.new(update_params)
    if @update.save
      SendUpdateTextJob.perform_later(@project, @update)
      flash[:notice] = 'Update added'
    else
      flash[:alert] = 'Update failed to save'
    end
    redirect_to @project
  end

  def edit
  end

  private
  def update_params
    params.require(:update).permit(:body, :category)
  end
end
