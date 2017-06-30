require 'uri'
require 'rest-client'
require 'dotenv-rails'
require 'digest/md5'
Comic.destroy_all

public_key = ENV['MARVEL_API_PUBLIC_KEY']
private_key = ENV['MARVEL_API_PRIVATE_KEY']
ts = Time.new
timestamp = ts.to_s
hash = Digest::MD5.hexdigest("#{timestamp}"+"#{private_key}"+"#{public_key}")

response = RestClient.get "http://gateway.marvel.com/v1//public/series?ts=#{timestamp}&apikey=#{public_key}&hash=#{hash}"

comics = JSON.parse(response)
data = comics["data"]["results"]
data.each do |comic|
  Comic.create!(
    publisher: "Marvel",
    title: comic["title"],
    creators:
      comic["creators"]["items"].each do |creator|
        creator["name"] + ", " + creator["role"]
      end,
    characters: comic["characters"]["items"].each do |character|
      character["name"]
    end,
    photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
  )
end
Comic.create!(publisher: "Image", title: "Saga", creators: ["Brian K Vaughn, writer", "Fiona Staples, illustrator"], characters: ["Marko", "Alana", "Hazel"], ongoing: true)
