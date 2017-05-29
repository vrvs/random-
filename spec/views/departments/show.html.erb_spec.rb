require 'rails_helper'

RSpec.describe "departments/show", type: :view do
  before(:each) do
    @department = assign(:department, Department.create!(
<<<<<<< HEAD
      :name => "Name",
      :string => "String"
=======
      :name => "Name"
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
<<<<<<< HEAD
    expect(rendered).to match(/String/)
=======
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
  end
end
