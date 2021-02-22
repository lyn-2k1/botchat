# require 'wit'
require 'httparty'
require 'json'
require 'uri'

class DowloadService
  def get_keyword(entity)
    url = "https://api.wit.ai/entities/"+entity.to_s+"?v=20200513"
    begin
      uri = URI.parse(url)
    rescue URI::InvalidURIError
      uri = URI.parse(URI.escape(url))
    end
    response=HTTParty.get(uri,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
    puts response.body
    a=JSON.parse(response.body)
    puts a["keywords"]
    return a["keywords"]
  end
end
entity = "findschool"
entity2 = "reviewschool"
@clt = DowloadService.new
file = File.new("keyword.json", "w+")
file.puts(@clt.get_keyword(entity))
file.puts(@clt.get_keyword(entity2))
file.close