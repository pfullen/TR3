class ProjectsController < ApplicationController

before_action :set_project, only: [:show, :edit, :update, :destroy, :project_length_in_weeks, :project_shifts]
	
def index
  @projects = Project.search(params[:term])
 end



def new
	@project = Project.new
end


def create
		@project = Project.new(project_params)
	
         @project.duration = project_length_in_weeks
  
	
		@date = @project.start_date.beginning_of_week


       # Automatically generate rosters for all weeks in the project
		
		
		@project.duration.times do 
			@roster = @project.rosters.new(week: @date)
				@project.num_of_employees do
					@roster_list = @roster.roster_lists.new
				end
		    @date = @date + 7
	    end 

	    
if @project.save
			redirect_to @project, notice: 'Project was created successfully'
		else
			render :new
		end
end



def show
	@project = Project.find(params[:id])
	@shift_count = 0 
	@shift_count = @shift_count.to_i
	  

end

def update
end


def new_store
   @projects = Project.where(project_type: "New Store")
end

def els
   @projects = Project.where(project_type: "SP_Project_ELS")
end

def fet
   @projects = Project.where(project_type: "SP_Project_FET")
end


def project_shifts 

end


def project_length_in_weeks
  @sdate = @project.start_date.beginning_of_week.strftime('%W')
  @edate = @project.end_date.beginning_of_week.strftime('%W')
  @sdate = @sdate.to_i
  @edate = @edate.to_i
  @duration = (@edate - @sdate)

end







def destroy
@project.delete
redirect_to projects_path, notice: 'Project was deleted successfully'
end


private 

def set_project
	
	@project = Project.find(params[:id])
end

def project_params
	  	params.require(:project).permit(:company, :project_type, :client, :store_num,
	  		:address, :city, :state, :invoice_to, :project_manager, :site_manager, :status, :billing,
	  		 :start_date, :end_date, :num_of_employees, :num_of_shifts, :duration, :term )
end





end



