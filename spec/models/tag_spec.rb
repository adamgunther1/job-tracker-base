require 'rails_helper'

describe Tag do
  describe "validations" do
    context "invalid attributes" do
      it "tag is invalid without a name" do
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver")
        tag = Tag.new()
        expect(tag).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Denver")
        tag = Tag.new(name: "funny")
        expect(tag).to be_valid
      end
    end
  end

end
