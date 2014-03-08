class CustomResponder < ActionController::Responder
  def to_format
    render json: {i_am_a: :json_response}
  end
end