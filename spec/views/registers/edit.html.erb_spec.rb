require 'rails_helper'

RSpec.describe "registers/edit", type: :view do
  before(:each) do
    @register = assign(:register, Register.create!(
      :weight => 1.5,
      :department => nil,
      :laboratory => nil,
      :residue => nil,
      :collection => nil
    ))
  end

  it "renders the edit register form" do
    render

    assert_select "form[action=?][method=?]", register_path(@register), "post" do

      assert_select "input#register_weight[name=?]", "register[weight]"

      assert_select "input#register_department_id[name=?]", "register[department_id]"

      assert_select "input#register_laboratory_id[name=?]", "register[laboratory_id]"

      assert_select "input#register_residue_id[name=?]", "register[residue_id]"

      assert_select "input#register_collection_id[name=?]", "register[collection_id]"
    end
  end
end
