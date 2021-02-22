require 'httparty'
require 'uri'
require 'json'

class UpdateService
  def create_keyword(keyword,synonyms,entity)

    url = "https://api.wit.ai/entities/"+entity.to_s+"/keywords?v=20200513"
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(URI.escape(url))
    end

    a={"keyword": keyword,
       "synonyms": [synonyms]}.to_json
    response=HTTParty.post(uri,body: a,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
    puts response.body
  end

  def create_intent(intent)

    # puts intent
    url = "https://api.wit.ai/intents?v=20200513"
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(URI.escape(url))
    end

    a={"name": intent}.to_json
    response=HTTParty.post(uri,body: a,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
    puts response.body
  end

  def create_entities(entities)

    url = "https://api.wit.ai/entities?v=20200513"
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(URI.escape(url))
    end

    a={
        "name": entities,
        "roles": []
    }.to_json
    response=HTTParty.post(uri,body: a,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
    puts response.body
  end

  def create_synonyms(synonyms,keywords,entities)
    url = "https://api.wit.ai/entities/"+entities.to_s+"/keywords/"+keywords.to_s+"/synonyms?v=20200513"
    puts (url)
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(URI.escape(url))
    end

    a={"synonym": synonyms}.to_json
    response=HTTParty.post(uri,body: a,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
    puts response.body
  end


end