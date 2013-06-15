json.array!(@highlights) do |highlight|
  json.extract! highlight, :selectedtext, :pageurl
  json.url highlight_url(highlight, format: :json)
end