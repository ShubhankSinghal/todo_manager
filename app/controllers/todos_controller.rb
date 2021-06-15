# todos_controller.rb
class TodosController < ApplicationController
  def index
    # render plain: Todo.order("due_date").map { |todo| todo.to_pleasant_string }
    # @current_user = current_user
    # @todos = Todo.of_user(current_user)
    @todos = current_user.todos
    render "index"
  end

  def show
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    # render plain: todo.to_pleasant_string
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
