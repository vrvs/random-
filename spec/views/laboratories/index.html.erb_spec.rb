require 'rails_helper'

RSpec.describe "laboratories/index", type: :view do
  before(:each) do
    assign(:laboratories, [
      Laboratory.create!(
        :name => "Name",
        :string => "String",
        :dep_name => "Dep Name",
        :string => "String",
        :facilitador => "Facilitador",
        :string => "String"
      ),
      Laboratory.create!(
        :name => "Name",
        :string => "String",
        :dep_name => "Dep Name",
        :string => "String",
        :facilitador => "Facilitador",
        :string => "String"
      )
    ])
  end

  it "renders a list of laboratories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Dep Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Facilitador".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
  end
end
