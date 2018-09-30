require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :user => User.first,
      :movie => FactoryBot.create(:movie),
      :box => "MyText"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", movie_path, "post" do

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[movie_id]"

      assert_select "textarea[name=?]", "comment[box]"
    end
  end
end
