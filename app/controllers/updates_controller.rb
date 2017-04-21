class UpdatesController < ApplicationController
  def index
  end

  def show
  end

  def create
    @project = Project.find(params[:project_id])
    @update = @project.updates.new(update_params)
    if @update.save
      @twilio_number = ENV['TWILIO_NUMBER']
      notice = "We got an update heah on #{@project.title}! #{url_for([@project, @update])}"
      # binding.pry
      Twilio::REST::Client.new.messages.create(
        from: @twilio_number,
        to: '+12038227132',
        body: notice
      )
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
