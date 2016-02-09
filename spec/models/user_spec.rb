require "rails_helper"

describe User do
  context "with valid data" do
    subject do
      build :user
    end

    it "is valid" do
      is_expected.to be_valid
    end
  end

  context "with no name" do
    subject do
      build :user, name: ""
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when name length is greater than 50" do
    subject do
      build :user, name: "n" * 51
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "with no email" do
    subject do
      build :user, email: ""
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when email length is greater than 255" do
    subject do
      build :user, email: "e" * 256
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "with invalid email" do
    subject do
      build :user, email: "email.example.com"
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when location length is greater than 50" do
    subject do
      build :user, location: "l" * 51
    end

    it "is invalid" do
      is_expected.to be_invalid
    end
  end

  context "when profile length is greater than 255" do
    subject do
      build :user, profile: "p" * 256
    end

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
    let (:email) {{email: "email@example.com"}}

    subject do
      -> do
        create :user_alice, email
        create :user_bob, email
      end
    end

    it "raise error ActiveRecord::RecordInvalid" do
      is_expected.to raise_error ActiveRecord::RecordInvalid
    end
  end

  context "with duplicated email (case insensitive)" do
    let (:email) {{email: "email@example.com"}}
    let (:duplicated_email_case_insensitive) {{email: "EMAIL@example.com"}}

    subject do
      -> do
        create :user_alice, email
        create :user_bob, duplicated_email_case_insensitive
      end
    end

    it "raise error ActiveRecord::RecordInvalid" do
      is_expected.to raise_error ActiveRecord::RecordInvalid
    end
  end
end
