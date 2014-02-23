class SceneActionsController < ApplicationController
  before_action :set_scene_action, only: [:show, :edit, :update, :destroy]

  # GET /scene_actions
  # GET /scene_actions.json
  def index
    @scene_actions = SceneAction.all
  end

  # GET /scene_actions/1
  # GET /scene_actions/1.json
  def show
  end

  # GET /scene_actions/new
  def new
    @scene_action = SceneAction.new
  end

  # GET /scene_actions/1/edit
  def edit
  end

  # POST /scene_actions
  # POST /scene_actions.json
  def create
    @scene_action = SceneAction.new(scene_action_params)

    respond_to do |format|
      if @scene_action.save
        format.html { redirect_to @scene_action, notice: 'Scene action was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scene_action }
      else
        format.html { render action: 'new' }
        format.json { render json: @scene_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scene_actions/1
  # PATCH/PUT /scene_actions/1.json
  def update
    respond_to do |format|
      if @scene_action.update(scene_action_params)
        format.html { redirect_to @scene_action, notice: 'Scene action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scene_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scene_actions/1
  # DELETE /scene_actions/1.json
  def destroy
    @scene_action.destroy
    respond_to do |format|
      format.html { redirect_to scene_actions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene_action
      @scene_action = SceneAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene_action_params
      params.require(:scene_action).permit(:name, :scene_id, :scene_callback_id)
    end
end
