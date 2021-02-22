# require 'wit'
require 'httparty'
require 'json'
require 'uri'
require 'koala'
# require 'graphAPI'
class UttranceService
    def up_message(message)
        @client = Wit.new(access_token: "IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY")
        org = @client.message(message)
    end
    def get_uttrance(message)
        url = "https://api.wit.ai/message?v=20200513&q="+message.to_s
        begin
            uri = URI.parse(url)
        rescue URI::InvalidURIError
            uri = URI.parse(URI.escape(url))
        end
        response=HTTParty.get(uri,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
        puts response.body
        a=JSON.parse(response.body)
        puts("++++++++++++")
        puts(a)
        puts("++++++++++++")
        if a["entities"].empty?
            return 0
        else
        return a["intents"][0]["confidence"]
        end
    end

    def post_uttrance(message,intent,entity,start,endd,body)
        url = "https://api.wit.ai/utterances?v=20200513"
        begin
            uri = URI.parse(url)
        rescue URI::InvalidURIError
            uri = URI.parse(URI.escape(url))
        end
        a=[{
            "text": message,
            "intent": intent,
            "entities":[
                {
                    "entity": "wit$"+entity.to_s+':'+entity.to_s,
                    "start": start,
                    "end": endd,
                    "body": body,
                    "entities": []
                }
            ],
            "traits": []
        }].to_json

        puts("++++++++++")
        puts(a)
        puts("++++++++++")
        response=HTTParty.post(uri,body: a,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
        puts response.body
    end
end

@org = UttranceService.new
@graph = Koala::Facebook::API.new("EAAnfVQiL9esBABW1T9rig7QAZA0ngzw5i4LDHfJq4df3o5Tc2fNAWoZCdyi6bnDhWbN01fJOKxseKJZBzRLmXJqXrjx3gRUiL37ZASyemFaqTVP9l3ZBEbuoHFpzNON3BxTirmr1e7RZCjgtQpREc2QZAi0cCArJMJBHSDCuk9bmGnMi0mNVlRzo8ZB6y71mT0JXiIHZCZCnrlK1MVZBVZBo9n52ECcUdzKk6GvRUWq8jGZC6pgZDZD")
data = @graph.get_connection("255791402550152","feed")
# data.attributes
file = File.open("post.json", "w")
data.each do |t|
  if(t["id"] != "255791402550152_255791409216818")
    datta={
        message: t["message"],
        idd: t["id"],
        pheduyet: @org.get_uttrance(t["message"])
    }.to_json
    file.puts(datta)
    puts datta
  end
end
file.close
