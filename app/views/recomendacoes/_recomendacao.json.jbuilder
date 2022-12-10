json.extract! recomendacao, :id, :titulo, :artista, :desc, :img, :created_at, :updated_at
json.url recomendacao_url(recomendacao, format: :json)
