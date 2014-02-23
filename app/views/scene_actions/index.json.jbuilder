json.array!(@scene_actions) do |scene_action|
  json.extract! scene_action, :id, :name, :scene_id, :scene_callback_id
  json.url scene_action_url(scene_action, format: :json)
end
