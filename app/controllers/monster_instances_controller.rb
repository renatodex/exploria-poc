class MonsterInstancesController < ApplicationController
  before_action :set_monster_instance, only: [:show, :edit, :update, :destroy]

  # GET /monster_instances
  # GET /monster_instances.json
  def index
    @monster_instances = MonsterInstance.all
  end

  # GET /monster_instances/1
  # GET /monster_instances/1.json
  def show
  end

  # GET /monster_instances/new
  def new
    @monster_instance = MonsterInstance.new
  end

  # GET /monster_instances/1/edit
  def edit
  end

  # POST /monster_instances
  # POST /monster_instances.json
  def create
    @monster_instance = MonsterInstance.new(monster_instance_params)

    respond_to do |format|
      if @monster_instance.save
        format.html { redirect_to @monster_instance, notice: 'Monster instance was successfully created.' }
        format.json { render action: 'show', status: :created, location: @monster_instance }
      else
        format.html { render action: 'new' }
        format.json { render json: @monster_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monster_instances/1
  # PATCH/PUT /monster_instances/1.json
  def update
    respond_to do |format|
      if @monster_instance.update(monster_instance_params)
        format.html { redirect_to @monster_instance, notice: 'Monster instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @monster_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monster_instances/1
  # DELETE /monster_instances/1.json
  def destroy
    @monster_instance.destroy
    respond_to do |format|
      format.html { redirect_to monster_instances_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monster_instance
      @monster_instance = MonsterInstance.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monster_instance_params
      params.require(:monster_instance).permit(:monster_id, :hp)
    end
end
