json.array!(@heros) do |hero|
  json.extract! hero, :id, :npc_id, :strength, :agility, :intelligence, :experience
  json.url hero_url(hero, format: :json)
end
