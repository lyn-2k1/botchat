json.extract! trainbot, :id, :message, :intent, :entity, :start, :end, :body, :created_at, :updated_at
json.url trainbot_url(trainbot, format: :json)
