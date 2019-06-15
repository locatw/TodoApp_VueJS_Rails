class Api::TodosController < ApplicationController
  # Disable since this app doesn't have user-authentication function.
  protect_from_forgery with: :null_session

  def create
    Todo.create!(text: params.require(:text))

    render body: nil, status: :created
  end

  def destroy
    id = params.require(:id).to_i

    Todo.find(id).destroy!

    head :no_content
  end

  def index
    render json: Todo.all
  end

  def update
    id = params.require(:id).to_i
    patch = params.require(:todo).permit(:text)

    Todo.find(id).update!(patch)

    head :ok
  end
end
