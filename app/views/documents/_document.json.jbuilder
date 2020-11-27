json.extract! document, :id, :name, :link, :created_at, :updated_at
json.url document_url(document, format: :json)
