json.array!(@npcs) do |npc|
  json.extract! npc, :id, :hp, :level, :name, :image, :fortitude, :class_armor, :will, :reflex
  json.url npc_url(npc, format: :json)
end
