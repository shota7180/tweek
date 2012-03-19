require 'spec_helper'

describe "projects/new" do
  before(:each) do
    assign(:project, stub_model(Project,
      :user_id => "MyString",
      :name => "MyString",
      :email => "MyString",
      :report_frequency => 1,
      :continuous_days => 1,
      :percent => 1,
      :isbonus => false
    ).as_new_record)
  end

  it "renders new project form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => projects_path, :method => "post" do
      assert_select "input#project_user_id", :name => "project[user_id]"
      assert_select "input#project_name", :name => "project[name]"
      assert_select "input#project_email", :name => "project[email]"
      assert_select "input#project_report_frequency", :name => "project[report_frequency]"
      assert_select "input#project_continuous_days", :name => "project[continuous_days]"
      assert_select "input#project_percent", :name => "project[percent]"
      assert_select "input#project_isbonus", :name => "project[isbonus]"
    end
  end
end
