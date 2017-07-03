require 'uri'
require 'rest-client'
require 'dotenv-rails'
require 'digest/md5'
Comic.destroy_all

public_key = ENV['MARVEL_API_PUBLIC_KEY']
private_key = ENV['MARVEL_API_PRIVATE_KEY']
ts = Time.new
ts2 = Time.new
ts3 = Time.new

timestamp = ts.to_s
timestamp_two = ts2.to_s
timestamp_three = ts3.to_s

hash = Digest::MD5.hexdigest("#{timestamp}"+"#{private_key}"+"#{public_key}")

first_response = RestClient.get "http://gateway.marvel.com/v1//public/series", {params: {ts: timestamp, apikey: ENV['MARVEL_API_PUBLIC_KEY'], hash: hash, seriesType: "ongoing", limit: 50, offset: 100}}
second_response = RestClient.get "http://gateway.marvel.com/v1//public/series", {params: {ts: timestamp_two, apikey: ENV['MARVEL_API_PUBLIC_KEY'], hash: hash, seriesType: "ongoing", limit: 50, offset: 200}}
third_response = RestClient.get "http://gateway.marvel.com/v1//public/series", {params: {ts: timestamp_three, apikey: ENV['MARVEL_API_PUBLIC_KEY'], hash: hash, seriesType: "ongoing", limit: 50, offset: 300}}



first_comics = JSON.parse(first_response)
first_data = first_comics["data"]["results"]
first_data.each do |comic|
  Comic.create!(
    publisher: "Marvel",
    title: comic["title"],
    photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
  )
end
second_comics = JSON.parse(second_response)
second_data = second_comics["data"]["results"]
second_data.each do |comic|
  Comic.create!(
    publisher: "Marvel",
    title: comic["title"],
    photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
  )
end
third_comics = JSON.parse(third_response)
third_data = third_comics["data"]["results"]
third_data.each do |comic|
  Comic.create!(
    publisher: "Marvel",
    title: comic["title"],
    photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
  )
end
