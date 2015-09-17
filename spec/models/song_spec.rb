require 'rails_helper'

RSpec.describe Song, type: :model do
  let(:song) do
    Song.new(title: "Hot Tubbin'", artist: "Clarence and the Machines")
  end

  it "is valid" do
    expect(song).to be_valid
  end

  it "is invalid without a title" do
    song.title = nil
    expect(song).to_not be_valid
  end

  it "is invalid without an artist" do
    song.artist = nil
    expect(song).to_not be_valid
  end
end

