class RosterListsController < ApplicationController
  before_action :set_roster_list, only: [:show, :edit, :update, :destroy, :copy_to_next_week]

  # GET /roster_lists
  # GET /roster_lists.json
  def index

    @roster_lists = RosterList.search(params[:term])
  end

  # GET /roster_lists/1
  # GET /roster_lists/1.json
  def show
  end

  # GET /roster_lists/new
  def new
     @roster = Roster.find(params[:roster_id])
    @roster_list = RosterList.new

     
  end

  # GET /roster_lists/1/edit
  def edit
  end

  def per_diem_info
    @roster_lists = RosterList.joins(:roster).search(params[:term])
    @roster_lists = @roster_lists.where.not(perdiem: "")
   

  end 
 


  # POST /roster_lists
  # POST /roster_lists.json
  def create

    @roster = Roster.find(params[:roster_id])
    @roster_list = @roster.roster_lists.build(roster_list_params)  

        
     

      if @roster_list.save
          #      flash [:notice] = 'Roster list was successfully created.' 
      redirect_to roster_roster_lists_path(@roster_list)
      else
        render :action => 'new'
       end
  end

  # PATCH/PUT /roster_lists/1
  # PATCH/PUT /roster_lists/1.json
  def update
      @roster = Roster.find(params[:roster_id])
    respond_to do |format|
      if @roster_list.update(roster_list_params)
        format.html { redirect_to @roster_list, notice: 'Roster list was successfully updated.' }
        format.json { render :show, status: :ok, location: @roster_list }
      else
        format.html { render :edit }
        format.json { render json: @roster_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roster_lists/1
  # DELETE /roster_lists/1.json
  def destroy
      @roster = Roster.find(params[:roster_id])
    @roster_list.destroy
    respond_to do |format|
      format.html { redirect_to roster_lists_url, notice: 'Roster list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster_list
      @roster_list = RosterList.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_list_params
      params.require(:roster_list).permit(:roster_id, :employee_id, :perdiem, :expense_code, :shift_id, :destroy)
    end
end

