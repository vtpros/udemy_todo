class TodosController < ApplicationController
  before_action :_todo, only: %i[show edit update]

  def show; end

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

  def edit

  end

  def update
    if @todo.update(todo_params)
      flash[:notece] = 'Todo was succesfully updated'
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  private

  def _todo
    @todo ||= Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :description)
  end
end
