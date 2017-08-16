class ProjectTypesController < ApplicationController


before_action :set_project_types, only: [:show, :edit, :update, :destroy]
	
def index
	@projects_types = ProjectType.all


end

def new
	@project_type = project_type.new
end


def create
		@project_type = ProjectType.new(project_type_params)
 end 

	    
if @project.save
			redirect_to @project_type, notice: 'Project Type was created successfully'
		else
			render :new
		end
end



def show
	

def update
end









def destroy
@project_type.delete
redirect_to project_types_path, notice: 'Project Type was deleted successfully'
end


private 

def set_project_types
	
	@project_type = ProjectType.find(params[:id])
end

def project_type_params
	  	params.require(:project_type).permit(:name, :id , :project_id )
end






end
