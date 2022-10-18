require "rails_helper"

RSpec.describe "User Sign up", :type => :system do
  before do
    driven_by(:rack_test)
  end

  it "allows a user to sign up" do
    visit "/users/new"

    fill_in "Name", :with => "Tom Hardy"
    fill_in "Email", :with => "thardy@fake.com"
    fill_in "Password", :with => "chicken"
    fill_in "Password confirmation", :with => "chicken"
    click_button "Create User"

    expect(page).to have_text("Welcome back, Tom Hardy")
    expect(page).to have_text("Create a new Deck")
  end
end
