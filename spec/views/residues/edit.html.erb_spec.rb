require 'rails_helper'

RSpec.describe "residues/edit", type: :view do
  before(:each) do
    @residue = assign(:residue, Residue.create!(
      :name => "MyString",
<<<<<<< HEAD
      :string => "MyString",
      :lab_name => "MyString",
      :string => "MyString",
      :weight => "MyString",
      :integer => "MyString",
      :type => "",
      :string => "MyString"
=======
      :type => "",
      :blend => "MyString",
      :onu => "MyString",
      :code => "MyString",
      :laboratory => nil
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    ))
  end

  it "renders the edit residue form" do
    render

    assert_select "form[action=?][method=?]", residue_path(@residue), "post" do

      assert_select "input#residue_name[name=?]", "residue[name]"

<<<<<<< HEAD
      assert_select "input#residue_string[name=?]", "residue[string]"

      assert_select "input#residue_lab_name[name=?]", "residue[lab_name]"

      assert_select "input#residue_string[name=?]", "residue[string]"

      assert_select "input#residue_weight[name=?]", "residue[weight]"

      assert_select "input#residue_integer[name=?]", "residue[integer]"

      assert_select "input#residue_type[name=?]", "residue[type]"

      assert_select "input#residue_string[name=?]", "residue[string]"
=======
      assert_select "input#residue_type[name=?]", "residue[type]"

      assert_select "input#residue_blend[name=?]", "residue[blend]"

      assert_select "input#residue_onu[name=?]", "residue[onu]"

      assert_select "input#residue_code[name=?]", "residue[code]"

      assert_select "input#residue_laboratory_id[name=?]", "residue[laboratory_id]"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    end
  end
end
