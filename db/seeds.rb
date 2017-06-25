require 'uri'
require 'rest-client'
require 'dotenv-rails'
require 'digest/md5'
Comic.destroy_all

public_key = ENV['MARVEL_API_PUBLIC_KEY']
private_key = ENV['MARVEL_API_PRIVATE_KEY']
ts = Time.new

hash = Digest::MD5.hexdigest(ts.to_s+private_key+public_key)

response = RestClient.get "http://gateway.marvel.com/v1//public/comics?ts=#{ts}&apikey=#{public_key}&hash=#{hash}"

comics = JSON.parse(response)
comics["series"].each do |comic|
  Comic.create!(
    publisher: "Marvel",
    title: comic["title"],
    creators:
      comic["creators"]["items"].each do |creator|
        name = creator["name"]
        role = creator["role"]
        "#{name}, #{role}"
      end,
    characters: comic["characters"]["items"].each do |character|
      character["name"]
    end,
    photo: comic["images"]["path"] + "." + comic["images"]["extension"]
  )
end
