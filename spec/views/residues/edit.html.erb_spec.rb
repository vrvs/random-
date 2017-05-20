require 'rails_helper'

RSpec.describe "residues/edit", type: :view do
  before(:each) do
    @residue = assign(:residue, Residue.create!(
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

  it "renders the edit residue form" do
    render

    assert_select "form[action=?][method=?]", residue_path(@residue), "post" do

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
