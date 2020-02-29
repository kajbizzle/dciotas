require 'rails_helper'

RSpec.describe Due, type: :model do


  it "is valid with valid attributes" do
    due = Due.new(
    title: "Test",
    description: "Test",
    amount: "155",
    status: "Active")
    expect(due).to be_valid
  end

  it "is not valid without a title" do
    due = Due.new(title: nil)
    expect(due).to_not be_valid
  end

  it "is not valid without a description" do
    due = Due.new(description: nil)
    expect(due).to_not be_valid
  end

  it "is not valid without an amount" do
    due = Due.new(amount: nil)
    expect(due).to_not be_valid
  end
  it "is not valid without a status" do
    due = Due.new(status: nil)
    expect(due).to_not be_valid
  end
end
