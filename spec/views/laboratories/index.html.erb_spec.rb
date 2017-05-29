require 'rails_helper'

RSpec.describe "laboratories/index", type: :view do
  before(:each) do
    assign(:laboratories, [
      Laboratory.create!(
        :name => "Name",
<<<<<<< HEAD
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
=======
        :department => nil,
        :user => nil
      ),
      Laboratory.create!(
        :name => "Name",
        :department => nil,
        :user => nil
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
      )
    ])
  end

  it "renders a list of laboratories" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
<<<<<<< HEAD
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Dep Name".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
    assert_select "tr>td", :text => "Facilitador".to_s, :count => 2
    assert_select "tr>td", :text => "String".to_s, :count => 2
=======
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
  end
end
