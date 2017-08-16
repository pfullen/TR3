class RostersController < ApplicationController
	before_action :set_rosters, only: [:show, :edit, :update,
	 :destroy, :search, :copy_roster_list]
	 
def index
#@rosters = Roster.search(params[:term])
@rosters = Roster.all
#@rosters = @rosters.joins(:roster_lists).order(:shift_id)

end



def new
	 #  @project = Project.find(params[:project_id])

	    @roster = Roster.new
	   
	    3.times do 
	    	@roster.roster_lists.build
	    end
	 #  respond_to do |format|
   
      #  format.html 
       # format.json# { render :json => @roster_list }
   #  
    
   # end
  end
	


 def create
 	@roster = Roster.new(roster_params)
 	if @roster.save
			redirect_to @roster, notice: 'Your new roster was created successfully'
		else
			render :new
		end
	end

def edit
	@test = params
 # @project = Project.find(params[:id])
	end

def show
end


def copy_roster_list

	# @check_for_nil = @roster.roster_lists.all.inspect  
	# @next_roster_id  = @roster.roster_lists.first.roster_id + 1 
	# @roster_lists = RosterList.where(:roster_id => @next_roster_id) 
    @roster.roster_lists.each do |roster_list| 
       roster_list.roster_id = roster_list.roster_id + 1         
         @roster_list = RosterList.create(roster_list.attributes.except("id"))
  		end
  # 		if @roster_list.save
			redirect_to root_path , notice: 'Your new roster was created successfully'
	#	else
	#		
	#	end
end  

def update
	      
    respond_to do |format|
      if @roster.update(roster_params)
        format.html { redirect_to project_path(@roster.project_id), notice: 'Roster was successfully updated.' }
        format.json { render :show, status: :ok, location: @roster}
      else
        format.html { render :edit }
        format.json { render json: @roster.errors, status: :unprocessable_entity }
      end
    end
  end



def destroy

end

private

def set_rosters
#s@project = Project.find(params[:id])
@roster = Roster.find(params[:id])


end


def roster_params
	params.require(:roster).permit(:project_id, :week , :term, 
		roster_lists_attributes: [:id, :employee_id, :perdiem, :copy_roster_list, :expense_code, :shift_id, :destroy, :search ])
end

def roster_list_params
      params.require(:roster_list).permit(:roster_id, :employee_id, :perdiem, :expense_code, :shift_id, :destroy)
    end


end
