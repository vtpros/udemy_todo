class TodosController < ApplicationController

  def show
    @todo = Todo.find(params[:id])
  end
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = 'Todo was created succesfully'
      redirect_to todo_path(@todo)
    else
      render :new
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
