class TodosController < ApplicationController
	def index
		@todos = Todo.all
	end

	def new
		@todos = Todo.new
	end

	def create
		@todo = Todo.new(todo_params)
		@todo.save
		redirect_to todos_path
	end

	def show
		@todo = Todo.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
 	end

 	def update
		 @todo.update(todo_params)
		 redirect_to todos_path
 	end
 	def destroy
 		@todo.destroy
 		redirect_to todos_path
 	end

	private
		def todo_params
			params.require(:todo).permit(:description, :completed)
		end

		def find_todo
			@todo = Todo.find(params[:id])
		end
end
