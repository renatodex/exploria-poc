json.array!(@scene_nodes) do |scene_node|
  json.extract! scene_node, :id, :scene_id, :neighbor_scene_id
  json.url scene_node_url(scene_node, format: :json)
end
