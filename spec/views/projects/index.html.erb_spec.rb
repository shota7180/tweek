require 'spec_helper'

describe "projects/index" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :user_id => "User",
        :name => "Name",
        :email => "Email",
        :report_frequency => 1,
        :continuous_days => 1,
        :percent => 1,
        :isbonus => false
      ),
      stub_model(Project,
        :user_id => "User",
        :name => "Name",
        :email => "Email",
        :report_frequency => 1,
        :continuous_days => 1,
        :percent => 1,
        :isbonus => false
      )
    ])
  end

  it "renders a list of projects" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "User".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
