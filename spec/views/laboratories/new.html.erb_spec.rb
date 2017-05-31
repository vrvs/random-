require 'rails_helper'

RSpec.describe "laboratories/new", type: :view do
  before(:each) do
    assign(:laboratory, Laboratory.new(
      :name => "MyString",
<<<<<<< HEAD
      :string => "MyString",
      :dep_name => "MyString",
      :string => "MyString",
      :facilitador => "MyString",
      :string => "MyString"
=======
      :department => nil,
      :user => nil
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    ))
  end

  it "renders new laboratory form" do
    render

    assert_select "form[action=?][method=?]", laboratories_path, "post" do

      assert_select "input#laboratory_name[name=?]", "laboratory[name]"

<<<<<<< HEAD
      assert_select "input#laboratory_string[name=?]", "laboratory[string]"

      assert_select "input#laboratory_dep_name[name=?]", "laboratory[dep_name]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"

      assert_select "input#laboratory_facilitador[name=?]", "laboratory[facilitador]"

      assert_select "input#laboratory_string[name=?]", "laboratory[string]"
=======
      assert_select "input#laboratory_department_id[name=?]", "laboratory[department_id]"

      assert_select "input#laboratory_user_id[name=?]", "laboratory[user_id]"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    end
  end
end
