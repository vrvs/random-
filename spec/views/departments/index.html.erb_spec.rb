require 'rails_helper'

RSpec.describe "departments/index", type: :view do
  before(:each) do
    assign(:departments, [
      Department.create!(
<<<<<<< HEAD
        :name => "Name",
        :string => "String"
      ),
      Department.create!(
        :name => "Name",
        :string => "String"
=======
        :name => "Name"
      ),
      Department.create!(
        :name => "Name"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
      )
    ])
  end

  it "renders a list of departments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
<<<<<<< HEAD
    assert_select "tr>td", :text => "String".to_s, :count => 2
=======
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
  end
end
