require 'rails_helper'

RSpec.describe "laboratories/new", type: :view do
  before(:each) do
    assign(:laboratory, Laboratory.new(
      :name => "MyString",
      :string => "MyString",
      :dep_name => "MyString",
      :string => "MyString",
      :facilitador => "MyString",
      :string => "MyString"
    ))
  end

  it "renders new laboratory form" do
    render

    assert_select "form[action=?][method=?]", laboratories_path, "post" do

      assert_select "input#laboratory_name[name=?]", "laboratory[name]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"

      assert_select "input#laboratory_dep_name[name=?]", "laboratory[dep_name]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"

      assert_select "input#laboratory_facilitador[name=?]", "laboratory[facilitador]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"
    end
  end
end
