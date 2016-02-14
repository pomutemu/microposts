require "rails_helper"

describe Micropost do
  subject do
    build :micropost, opts
  end

  context "with valid data" do
    let (:opts) {{}}

    it "is valid" do
      is_expected.to be_valid
    end
  end

  context "with no user_id" do
    let (:opts) {{user_id: ""}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "with no content" do
    let (:opts) {{content: ""}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when content length is greater than 140" do
    let (:opts) {{content: "c" * 141}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end
end
