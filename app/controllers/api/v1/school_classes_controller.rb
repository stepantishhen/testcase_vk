module Api
  module V1
    class SchoolClassesController < ApplicationController
      def index
        classes = SchoolClass.where(school_id: params[:school_id])
        render json: { data: classes }
      end
    end
  end
end