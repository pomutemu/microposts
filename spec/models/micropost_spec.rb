require "rails_helper"

describe Micropost do
  context "with valid data" do
    subject do
      build :micropost
    end

    it "is valid" do
      is_expected.to be_valid
    end
  end

  context "with no user_id" do
    subject do
      build :micropost, user_id: ""
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "with no content" do
    subject do
      build :micropost, content: ""
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when content length is greater than 140" do
    subject do
      build :micropost, content: "c" * 141
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end
end
