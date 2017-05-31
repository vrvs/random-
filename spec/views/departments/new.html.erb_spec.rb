require 'rails_helper'

RSpec.describe "departments/new", type: :view do
  before(:each) do
    assign(:department, Department.new(
<<<<<<< HEAD
      :name => "MyString",
      :string => "MyString"
=======
      :name => "MyString"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    ))
  end

  it "renders new department form" do
    render

    assert_select "form[action=?][method=?]", departments_path, "post" do

      assert_select "input#department_name[name=?]", "department[name]"
<<<<<<< HEAD

      assert_select "input#department_string[name=?]", "department[string]"
=======
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    end
  end
end
