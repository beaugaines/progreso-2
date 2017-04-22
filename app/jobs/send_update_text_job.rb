class SendUpdateTextJob < ApplicationJob
  queue_as :default

  def perform(project, update)
    @client = Twilio::REST::Client.new
    update_link = project_update_url(project, update, host: 'https://www.progreso.io')
    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['ADMIN_NUMBER'],
      body: "Progreso! update on #{project.title}! #{update_link}"
    )
  end

end
