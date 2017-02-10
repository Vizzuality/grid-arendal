class GraphicRequestMailer < ApplicationMailer
  def graphic_requested graphic_request
    @graphic_request = graphic_request

    mail subject: "Graphic download request", to: @graphic_request.email
  end
end
