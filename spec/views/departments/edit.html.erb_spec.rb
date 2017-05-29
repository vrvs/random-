require 'rails_helper'

RSpec.describe "departments/edit", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
<<<<<<< HEAD
      :name => "MyString",
      :string => "MyString"
=======
      :name => "MyString"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    ))
  end

  it "renders the edit department form" do
    render

    assert_select "form[action=?][method=?]", department_path(@department), "post" do

      assert_select "input#department_name[name=?]", "department[name]"
<<<<<<< HEAD

      assert_select "input#department_string[name=?]", "department[string]"
=======
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    end
  end
end
