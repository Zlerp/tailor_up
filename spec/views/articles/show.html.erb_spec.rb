require 'rails_helper'

RSpec.describe "articles/show", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :kind => "Kind",
      :quantity => 1,
      :other => "Other",
      :appointment => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Kind/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Other/)
    expect(rendered).to match(//)
  end
end
