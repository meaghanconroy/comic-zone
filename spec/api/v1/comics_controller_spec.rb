require "rails_helper"

RSpec.describe Api::V1::ComicsController, type: :controller do
  describe "GET #index" do
      it "should return the list of comics" do
        comic = Comic.create(publisher: "Marvel", title: "Squirrel Girl", writer: "Ryan North", artist: "Erica Henderson", main_character: "Squirrel Girl", other_characters: "Koi Boy")
        get :index
        expect(json["comics"][0]["publisher"]).to eq "Marvel"
        expect(json["comics"][0]["title"]).to eq "Squirrel Girl"
        expect(json["comics"][0]["writer"]).to eq "Ryan North"
        expect(json["comics"][0]["artist"]).to eq "Erica Henderson"
        expect(json["comics"][0]["main_character"]).to eq "Squirrel Girl"
        expect(json["comics"][0]["other_characters"]).to eq "Koi Boy"
        expect(json["comics"][0]["id"]).to eq comic.id
      end
    end
end
