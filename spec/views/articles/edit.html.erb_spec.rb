require 'rails_helper'

RSpec.describe "articles/edit", type: :view do
  before(:each) do
    @article = assign(:article, Article.create!(
      :kind => "MyString",
      :quantity => 1,
      :other => "MyString",
      :appointment => nil
    ))
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", article_path(@article), "post" do

      assert_select "input#article_kind[name=?]", "article[kind]"

      assert_select "input#article_quantity[name=?]", "article[quantity]"

      assert_select "input#article_other[name=?]", "article[other]"

      assert_select "input#article_appointment_id[name=?]", "article[appointment_id]"
    end
  end
end
