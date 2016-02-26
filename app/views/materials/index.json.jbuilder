json.array!(@materials) do |material|
  json.extract! material, :id, :title, :description, :course_id
  json.url material_url(material, format: :json)
end
