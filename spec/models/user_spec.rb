require "rails_helper"

describe User do
  subject do
    build :user, opts
  end

  context "with valid data" do
    let (:opts) {{}}

    it "is valid" do
      is_expected.to be_valid
    end
  end

  context "with no name" do
    let (:opts) {{name: ""}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when name length is greater than 50" do
    let (:opts) {{name: "n" * 51}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "with no email" do
    let (:opts) {{email: ""}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when email length is greater than 255" do
    let (:opts) {{email: "e" * 256}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "with invalid email" do
    let (:opts) {{email: "email.example.com"}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when location length is greater than 50" do
    let (:opts) {{location: "l" * 51}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when profile length is greater than 255" do
    let (:opts) {{profile: "p" * 256}}

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "with not downcased email" do
    subject do
      create :user, email: "EMAIL@example.com"
    end

    it "becomes downcased" do
      is_expected.to have_attributes email: "email@example.com"
    end
  end

  context "with unique email" do
    subject do
      create :user_alice
      create :user_bob
    end

    it "is valid" do
      is_expected.to be_valid
    end
  end

  context "with duplicated email" do
    subject do
      -> do
        email = "email@example.com"

        create :user_alice, {email: email}
        create :user_bob, {email: email}
      end
    end

    it "raise error ActiveRecord::RecordInvalid" do
      is_expected.to raise_error ActiveRecord::RecordInvalid
    end
  end

  context "with duplicated email (case insensitive)" do
    subject do
      -> do
        email = "email@example.com"
        duplicated_email_case_insensitive = "EMAIL@example.com"

        create :user_alice, {email: email}
        create :user_bob, {email: duplicated_email_case_insensitive}
      end
    end

    it "raise error ActiveRecord::RecordInvalid" do
      is_expected.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
