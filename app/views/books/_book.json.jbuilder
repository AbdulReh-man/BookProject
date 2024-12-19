json.extract! book, :id, :name, :author, :edition, :price, :created_at, :updated_at
json.url book_url(book, format: :json)
