require 'uri'
require 'rest-client'
require 'dotenv-rails'
require 'digest/md5'
Comic.destroy_all

public_key = ENV['MARVEL_API_PUBLIC_KEY']
private_key = ENV['MARVEL_API_PRIVATE_KEY']
ts = Time.new
# ts2 = Time.new
# ts3 = Time.new
# ts4 = Time.new
# ts5 = Time.new
# ts6 = Time.new
timestamp = ts.to_s
# timestamp_two = ts2.to_s
# timestamp_three = ts3.to_s
# timestamp_four = ts4.to_s
# timestamp_five = ts5.to_s
# timestamp_six = ts6.to_s

hash = Digest::MD5.hexdigest("#{timestamp}"+"#{private_key}"+"#{public_key}")

first_response = RestClient.get "http://gateway.marvel.com/v1//public/series", {params: {ts: timestamp, apikey: ENV['MARVEL_API_PUBLIC_KEY'], hash: hash, seriesType: "ongoing", limit: 50}}
# second_response = RestClient.get "http://gateway.marvel.com/v1//public/series?ts=#{timestamp_two}&apikey=#{public_key}&hash=#{hash}&seriesType=ongoing&limit=50&offset=50"
# third_response = RestClient.get "http://gateway.marvel.com/v1//public/series?ts=#{timestamp_three}&apikey=#{public_key}&hash=#{hash}&seriesType=ongoing&limit=50&offset=100"
# fourth_response = RestClient.get "http://gateway.marvel.com/v1//public/series?ts=#{timestamp_four}&apikey=#{public_key}&hash=#{hash}&seriesType=ongoing&limit=50&offset=150"
# fifth_response = RestClient.get "http://gateway.marvel.com/v1//public/series?ts=#{timestamp_five}&apikey=#{public_key}&hash=#{hash}&seriesType=ongoing&limit=50&offset=200"
# sixth_response = RestClient.get "http://gateway.marvel.com/v1//public/series?ts=#{timestamp_six}&apikey=#{public_key}&hash=#{hash}&seriesType=ongoing&limit=50&offset=250"

first_comics = JSON.parse(first_response)
first_data = first_comics["data"]["results"]
first_data.each do |comic|
  Comic.create!(
    publisher: "Marvel",
    title: comic["title"],
    photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
  )
end
# second_comics = JSON.parse(second_response)
# second_data = second_comics["data"]["results"]
# second_data.each do |comic|
#   Comic.create!(
#     publisher: "Marvel",
#     title: comic["title"],
#     photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
#   )
# end
# third_comics = JSON.parse(third_response)
# third_data = third_comics["data"]["results"]
# third_data.each do |comic|
#   Comic.create!(
#     publisher: "Marvel",
#     title: comic["title"],
#     photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
#   )
# end
# fourth_comics = JSON.parse(fourth_response)
# fourth_data = fourth_comics["data"]["results"]
# fourth_data.each do |comic|
#   Comic.create!(
#     publisher: "Marvel",
#     title: comic["title"],
#     photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
#   )
# end
# fifth_comics = JSON.parse(fifth_response)
# fifth_data = fifth_comics["data"]["results"]
# fifth_data.each do |comic|
#   Comic.create!(
#     publisher: "Marvel",
#     title: comic["title"],
#     photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
#   )
# end
# sixth_comics = JSON.parse(sixth_response)
# sixth_data = sixth_comics["data"]["results"]
# sixth_data.each do |comic|
#   Comic.create!(
#     publisher: "Marvel",
#     title: comic["title"],
#     photo: comic["thumbnail"]["path"] + "." + comic["thumbnail"]["extension"]
#   )
# end
