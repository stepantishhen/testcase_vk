class ApplicationController < ActionController::API
  private

  def authenticate_student!
    token = request.headers['Authorization']&.split(' ')&.last
    @current_student = Student.find_by(auth_token: token)
    
    render json: { error: 'Unauthorized' }, status: :unauthorized unless @current_student
  end
end
