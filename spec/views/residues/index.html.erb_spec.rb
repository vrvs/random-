require 'rails_helper'

RSpec.describe "residues/index", type: :view do
  before(:each) do
    assign(:residues, [
      Residue.create!(
        :name => "Name",
<<<<<<< HEAD
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
=======
        :type => "Type",
        :blend => "Blend",
        :onu => "Onu",
        :code => "Code",
        :laboratory => nil
      ),
      Residue.create!(
        :name => "Name",
        :type => "Type",
        :blend => "Blend",
        :onu => "Onu",
        :code => "Code",
        :laboratory => nil
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
      )
    ])
  end

  it "renders a list of residues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
<<<<<<< HEAD
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Lab Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Weight".to_s, :count => 2
    assert_select "tr>td", :text => "Integer".to_s, :count => 2
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
=======
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "Blend".to_s, :count => 2
    assert_select "tr>td", :text => "Onu".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
  end
end
