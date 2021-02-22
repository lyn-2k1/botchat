require 'koala'
require 'json'
class GraphAPI
  def get_data
    @graph = Koala::Facebook::API.new("EAAnfVQiL9esBACsCW4vFz2KOIVLRSRnn4MViVUy6JywHxGvHywhbvZAV5JNCRt4ZBzvZBLPzNkGocZBp9ddnQ45h308EZB9FKTdYJtcKlWY8saLjwdm9TUQLDdrTk407Jl5l1lI01HH2N4sYGva9wB1CDVZAWuQ5CC2fZC1lc9rCis5vaNdrX4DjKZAf6FRU8bAo46oSZAk3KEPFppszMcymSMnT2TyCOx0XWiYJEKofsIwZDZD")
    profile = @graph.get_object("me",fields: 'id, name')
    # groupid = @graph.get_connection(profile['id'],"groups")
    # data = @graph.get_object_medata("255791402550152")
    data = @graph.get_connection("255791402550152","feed")
    # data = @graph.get_connection("255791402550152","posts")
    # puts groupid
    return data

  end
end
    # srp = String.new
    # data.each do |t|
    # srp = srp.to_s + "-" + t["message"].to_s
    # end
    # puts("---------")
    # rsp = srp.split("-")
    # response = Hash.new
    # response.store("message", rsp)
# @org = GraphAPI.new
# datta = @org.get_data
# puts datta
# file = File.new("db/post.json", "w+")
# datta.each do |t|
#   file.puts(t)
# end
# file.close

Koala.config.api_version = "v9.0"
