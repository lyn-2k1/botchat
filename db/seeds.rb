# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# require 'wit'
# require 'list'
require 'json'
require 'uri'
require 'unidecoder'

file = File.open('db/keyword.json', 'r:utf-8').read
json = file.force_encoding("UTF-8")
all_entities = JSON.parse(json)
puts all_entities
# @key = List.new
all_entities.each do |entity|
  entity['keyword'].each do |keyword|
    List.find_or_create_by(keyword: keyword['keyword'], synonyms: keyword["synonyms"], entities: entity['entities'])
  end
end
puts ("++++++")
# file.close
file = File.open('app/service/post.json','r:utf-8').read
file1 = File.open('app/service/unapproved_post.json','r:utf-8').read
json = file.force_encoding("UTF-8")
json1 = file1.force_encoding("UTF-8")
all_post = JSON.parse(json) + JSON.parse(json1)
puts all_post
# @key = List.new
all_post.each do |post|
  Faceapi.find_or_create_by(message: post["message"], idd: post["idd"], pheduyet: post["pheduyet"])
end
# file.close
# file = File.open('')


  # if List.all.find_by(:entities=> keyword["entities"])
  #   keyword["keyword"].each do |t|
  #   if List.all.find_by(:keyword=> t["keyword"])
  #     List.create({synonyms: keyword["synonyms"]})
  #   elsif
  #     List.create({keyword: keyword["keyword"],synonyms: keyword["synonyms"]})
  #   end
  #   end
  # elsif
  #   List.create({keyword: keyword["keyword"],synonyms: keyword["synonyms"],entities: keyword["entities"]})
  #
  # end_with
# end
# config   = List.configuration.database_configuration
# host     = config[List.env]["keyword"]
# posts = List.includes(:keyword)
# # puts posts
# #   UPDATE List
# #   SET synonyms = data
# #   WHERE List.find({:keyword=> keyword["keyword"]})
# # else
#   data = {
#       "keyword": keyword["keyword"],
#       "synonyms": keyword["synonyms"]
#   }
#   INSERT INTO List (keyword, synonyms)
#   VALUES
#   (keyword["keyword"],keyword["synonyms"]);
# class DowloadService
#   def get_keyword(entity)
#     url = "https://api.wit.ai/entities/"+entity.to_s+"?v=20200513"
#     begin
#       uri = URI.parse(url)
#     rescue URI::InvalidURIError
#       uri = URI.parse(URI.escape(url))
#     end
#     response=HTTParty.get(uri,headers: { 'Authorization' => 'Bearer IVQ3RABV6SSVZG3W6FAUNLAMP6H2J6IY',"Content-Type" => "application/json" })
#     puts response.body
#     a=JSON.parse(response.body)
#     puts a["keywords"]
#     return a["keywords"]
#   end
#   private
#   entity = "findschool"
#   entity2 = "reviewschool"
#   @clt = DowloadService.new
#   file = File.new("keyword.json", "w+")
#   file.puts(@clt.get_keyword(entity))
#   file.puts(@clt.get_keyword(entity2))
#   file.close
# end
# List.delete_all







