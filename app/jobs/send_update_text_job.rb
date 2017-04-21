class SendUpdateTextJob < ApplicationJob
  queue_as :default

  def perform(project, update)
    @twilio_number = ENV['TWILIO_NUMBER']
    @client = Twilio::REST::Client.new
    @client.messages.create(
      from: @twilio_number,
      to: ENV['ADMIN_NUMBER'],
      body: "Progreso! update on #{project.title}! #{project_update_url(project, update, host: 'progreso.io')}"
    )
  end

end
