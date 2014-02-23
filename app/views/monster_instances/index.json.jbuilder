json.array!(@monster_instances) do |monster_instance|
  json.extract! monster_instance, :id, :monster_id, :hp
  json.url monster_instance_url(monster_instance, format: :json)
end
