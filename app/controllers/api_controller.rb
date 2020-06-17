class ApiController < ApplicationController
  rescue_from 'ActiveRecord::RecordNotFound' do |_exc|
    render json: { errors: ['Record not found'] }, status: :not_found
  end

  rescue_from 'ActiveRecord::RecordNotUnique' do |_exc|
    render json: { errors: ['Duplicates not allowed'] }, status: :unprocessable_entity
  end
end
