class SceneNodesController < ApplicationController
  before_action :set_scene_node, only: [:show, :edit, :update, :destroy]

  # GET /scene_nodes
  # GET /scene_nodes.json
  def index
    @scene_nodes = SceneNode.all
  end

  # GET /scene_nodes/1
  # GET /scene_nodes/1.json
  def show
  end

  # GET /scene_nodes/new
  def new
    @scene_node = SceneNode.new
  end

  # GET /scene_nodes/1/edit
  def edit
  end

  # POST /scene_nodes
  # POST /scene_nodes.json
  def create
    @scene_node = SceneNode.new(scene_node_params)

    respond_to do |format|
      if @scene_node.save
        format.html { redirect_to @scene_node, notice: 'Scene node was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scene_node }
      else
        format.html { render action: 'new' }
        format.json { render json: @scene_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scene_nodes/1
  # PATCH/PUT /scene_nodes/1.json
  def update
    respond_to do |format|
      if @scene_node.update(scene_node_params)
        format.html { redirect_to @scene_node, notice: 'Scene node was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scene_node.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scene_nodes/1
  # DELETE /scene_nodes/1.json
  def destroy
    @scene_node.destroy
    respond_to do |format|
      format.html { redirect_to scene_nodes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scene_node
      @scene_node = SceneNode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scene_node_params
      params.require(:scene_node).permit(:scene_id, :neighbor_scene_id)
    end
end
