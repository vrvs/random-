require 'rails_helper'

RSpec.describe "residues/index", type: :view do
  before(:each) do
    assign(:residues, [
      Residue.create!(
        :name => "Name",
        :string => "String",
        :lab_name => "Lab Name",
        :string => "String",
        :weight => "Weight",
        :integer => "Integer",
        :type => "Type",
        :string => "String"
      ),
      Residue.create!(
        :name => "Name",
        :string => "String",
        :lab_name => "Lab Name",
        :string => "String",
        :weight => "Weight",
        :integer => "Integer",
        :type => "Type",
        :string => "String"
      )
    ])
  end

  it "renders a list of residues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Lab Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Weight".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
  end
end
