class ClassRostersController < ApplicationController
  before_action :set_class_roster, only: [:show, :edit, :update, :destroy, :toggle_status]
  before_action :authenticate_user!
  
  access all: [:show, :index], user: {except: [:destroy, :new, :create, :update, :edit, :toggle_status]}, admin: :all

  # GET /class_rosters
   
    # @aclass_rosters = ClassRoster.status
    
    # @astudents = Post.approved.timeslots{"afternoon"}

  def index
    if logged_in?(:admin)
    @class_rosters = ClassRoster.all
    @mstudents = Post.morning.approved
    @astudents = Post.afternoon.approved
    @posts = Post.all
  else 
    @class_rosters = ClassRoster.Active
  end
    @page_title = "TLC Active Classes"
  end

  # GET /class_rosters/1
  def show
  end

  # GET /class_rosters/new
  def new
    @class_roster = ClassRoster.new
  end

  # GET /class_rosters/1/edit
  def edit
  end

  # POST /class_rosters
  def create
    @class_roster = ClassRoster.new(class_roster_params)

    if @class_roster.save
      redirect_to @class_roster, notice: 'Class roster was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /class_rosters/1
  def update
    if @class_roster.update(class_roster_params)
      redirect_to @class_roster, notice: 'Class roster was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /class_rosters/1
  def destroy
    @class_roster.destroy
    redirect_to class_rosters_url, notice: 'Class roster was successfully destroyed.'
  end

  def toggle_status
    if @class_roster.Active?
      @class_roster.Inactive!
    elsif @class_roster.Inactive?
      @class_roster.Active!
    end
    redirect_to class_rosters_url, notice: 'Class has been updated'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_class_roster
      @class_roster = ClassRoster.friendly.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def class_roster_params
      params.require(:class_roster).permit(:title, :subtitle, :count, :description)
    end
end
