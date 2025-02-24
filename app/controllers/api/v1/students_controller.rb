module Api
  module V1
    class StudentsController < ApplicationController
      before_action :authenticate_student!, only: [:destroy]
      
      def create
        student = Student.new(student_params)
        
        if student.save
          response.headers['X-Auth-Token'] = student.auth_token
          render json: student, status: :created
        else
          render json: { errors: student.errors }, status: :unprocessable_entity
        end
      end

      def destroy
        if @current_student.id == params[:id].to_i
          @current_student.destroy
          head :no_content
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      def index
        students = Student.where(school_id: params[:school_id], class_id: params[:class_id])
        render json: { data: students }
      end

      private

      def student_params
        params.require(:student).permit(:first_name, :last_name, :surname, :class_id, :school_id)
      end
    end
  end
end