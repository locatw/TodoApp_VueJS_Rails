class Api::TodosController < ApplicationController
  # Disable since this app doesn't have user-authentication function.
  protect_from_forgery with: :null_session

  def create
    Todo.create!(text: params.require(:text))

    render body: nil, status: :created
  end

  def index
    render json: Todo.all
  end
end
