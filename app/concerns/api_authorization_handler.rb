module ApiAuthorizationHandler
  extend ActiveSupport::Concern

  def authorize_request
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
    rescue ActiveRecord::RecordNotFound => e
      render_error_response(errors: e.message, status: 401)
    rescue JWT::DecodeError => e
      render_error_response(errors: e.message, status: 401)
    end
  end
end