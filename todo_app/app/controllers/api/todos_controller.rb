class Api::TodosController < ApplicationController
  def index
    render json: [{id: 0, text: 'todo1'}]
  end
end
