class ClassRostersController < ApplicationController
  before_action :set_class_roster, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], user: :all

  # GET /class_rosters
  def index
    @class_rosters = ClassRoster.all
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
