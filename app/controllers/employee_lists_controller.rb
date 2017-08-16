class EmployeeListsController < ApplicationController
		before_action :set_employee_list, only: [:show, :edit, :update, :destroy]

def index
	@employee_lists = EmployeeList.all
end

def new
		@employee_list = EmployeeList.new
end

def create
	@employee_list = EmployeeList.new(employee_list_params)
		
	if @employee_list.save
			redirect_to @employee_list, notice: 'Employee was addded successfully'
		else
			render :new
		end
	
end



def show
end





private

def employee_list_params
	params.require(:employee_list).permit(:employee_id, :assigned_to_new_project, :roster_id, :full_name, :per_diem, :expense_code)
end



def set_employee_list
	  	@employee_list = EmployeeList.find(params[:id])
end

end




