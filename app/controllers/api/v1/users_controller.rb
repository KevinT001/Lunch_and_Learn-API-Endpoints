class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.api_key = SecureRandom.hex(6)
    if user.valid?
      user.save
      render json: UsersSerializer.new(user), status: 201
    else

      render :json => { :errors => user.errors.full_messages }
    end
  end


  private
  def user_params
    params.permit(:name, :email )
  end 
end 