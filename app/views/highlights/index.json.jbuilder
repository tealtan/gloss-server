json.array!(@highlights) do |highlight|
  json.extract! highlight, :selected_text, :surrounding_text, :page_url, :user_id
  json.url highlight_url(highlight, format: :json)
end