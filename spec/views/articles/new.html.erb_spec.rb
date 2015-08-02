require 'rails_helper'

RSpec.describe "articles/new", type: :view do
  before(:each) do
    assign(:article, Article.new(
      :type => "",
      :quantity => 1,
      :other => "MyString",
      :appointment => nil
    ))
  end

  it "renders new article form" do
    render

    assert_select "form[action=?][method=?]", articles_path, "post" do

      assert_select "input#article_type[name=?]", "article[type]"

      assert_select "input#article_quantity[name=?]", "article[quantity]"

      assert_select "input#article_other[name=?]", "article[other]"

      assert_select "input#article_appointment_id[name=?]", "article[appointment_id]"
    end
  end
end
