require 'rails_helper'

RSpec.describe "Logging into Company" do
  it "log in successfully" do
    visit(root_path)

    click_link("Company Login")
    fill_in('Email', with: 'caveat@caveat.co')
    fill_in('Password', with: 'caveat')
    click_button('Log in')

    expect(page).to have_content('Company Show Page')
  end
end
