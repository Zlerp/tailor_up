require 'rails_helper'

RSpec.describe "Sign up Company" do
  it "Sign Up successfully" do
    visit(root_path)

    click_link("Company Login")
    click_link("Sign up")
    fill_in('Name', with: 'Test')
    fill_in('Email', with: 'Test@company.com')
    fill_in('Password', with: 'testingcompany')
    fill_in('Password confirmation', with: 'testingcompany')
    fill_in('Location', with: 'Wynwood')
    click_button('Create Company')
  end
  it "Sign in successfully" do
    click_link("Company Login")
    fill_in('Email', with: 'Test@company.com')
    fill_in('Password', with: 'testingcompany')
    click_button('Log in')

    expect(page).to have_content('Company Show Page')
  end
end
