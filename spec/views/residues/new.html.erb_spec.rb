require 'rails_helper'

RSpec.describe "residues/new", type: :view do
  before(:each) do
    assign(:residue, Residue.new(
      :name => "MyString",
      :string => "MyString",
      :lab_name => "MyString",
      :string => "MyString",
      :weight => "MyString",
      :integer => "MyString",
      :type => "",
      :string => "MyString"
    ))
  end

  it "renders new residue form" do
    render

    assert_select "form[action=?][method=?]", residues_path, "post" do

      assert_select "input#residue_name[name=?]", "residue[name]"

      assert_select "input#residue_string[name=?]", "residue[string]"

      assert_select "input#residue_lab_name[name=?]", "residue[lab_name]"

      assert_select "input#residue_string[name=?]", "residue[string]"

      assert_select "input#residue_weight[name=?]", "residue[weight]"

      assert_select "input#residue_integer[name=?]", "residue[integer]"

      assert_select "input#residue_type[name=?]", "residue[type]"

      assert_select "input#residue_string[name=?]", "residue[string]"
    end
  end
end
