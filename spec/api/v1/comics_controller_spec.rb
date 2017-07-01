require "rails_helper"

RSpec.describe Api::V1::ComicsController, type: :controller do
  describe "GET #index" do
      it "should return the list of comics" do
        comic = Comic.create(publisher: "Marvel", title: "Squirrel Girl", creators: ["Ryan North", "Another Creator"], characters: ["fjdklsjfkldsjfkdls", "fjdkslfjsldf"])
        get :index
        expect(json["comics"][0]["publisher"]).to eq "Marvel"
        expect(json["comics"][0]["title"]).to eq "Squirrel Girl"
        expect(json["comics"][0]["creators"][0]).to eq "Ryan North"
        expect(json["comics"][0]["characters"][0]).to eq "fjdklsjfkldsjfkdls"
        expect(json["comics"][0]["id"]).to eq comic.id
      end
    end
end
