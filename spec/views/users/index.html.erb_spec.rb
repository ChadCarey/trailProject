require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :password => "Password",
        :salt => "Salt",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :user_type => "User Type"
      ),
      User.create!(
        :username => "Username",
        :password => "Password",
        :salt => "Salt",
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :user_type => "User Type"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Salt".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "User Type".to_s, :count => 2
  end
end
