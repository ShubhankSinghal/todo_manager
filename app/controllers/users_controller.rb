# todos_controller.rb
class UsersController < ApplicationController
  def new
    render "users/new"
  end

  def index
    render plain: User.order("id").map { |user| user.to_pleasant_string }
  end

  def show
    id = params[:id]
    user = User.find(id)
    render plain: user.to_pleasant_string
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end

  def login
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    render plain: user.present?
  end
end
