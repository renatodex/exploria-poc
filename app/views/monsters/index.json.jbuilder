json.array!(@monsters) do |monster|
  json.extract! monster, :id, :npc_id
  json.url monster_url(monster, format: :json)
end
