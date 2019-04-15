require 'rails_helper'

RSpec.describe beer do

  it "exists" do
    beer = Beer.new
    expect(beer.exists?).to be_truthy
  end
end
