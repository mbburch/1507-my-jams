require "rails_helper"

RSpec.describe SongsController, type: :controller do

  let(:valid_attributes) {
    { title: "Hot Tubbin'", artist: "Clarence and the Machines" }
  }

  let(:invalid_attributes) {
    { title: nil, artist: nil }
  }


end