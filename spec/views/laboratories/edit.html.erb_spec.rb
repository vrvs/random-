require 'rails_helper'

RSpec.describe "laboratories/edit", type: :view do
  before(:each) do
    @laboratory = assign(:laboratory, Laboratory.create!(
      :name => "MyString",
      :string => "MyString",
      :dep_name => "MyString",
      :string => "MyString",
      :facilitador => "MyString",
      :string => "MyString"
    ))
  end

  it "renders the edit laboratory form" do
    render

    assert_select "form[action=?][method=?]", laboratory_path(@laboratory), "post" do

      assert_select "input#laboratory_name[name=?]", "laboratory[name]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"

      assert_select "input#laboratory_dep_name[name=?]", "laboratory[dep_name]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"

      assert_select "input#laboratory_facilitador[name=?]", "laboratory[facilitador]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"
    end
  end
end
