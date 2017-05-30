require 'rails_helper'

RSpec.describe "laboratories/show", type: :view do
  before(:each) do
    @laboratory = assign(:laboratory, Laboratory.create!(
      :name => "Name",
<<<<<<< HEAD
      :string => "String",
      :dep_name => "Dep Name",
      :string => "String",
      :facilitador => "Facilitador",
      :string => "String"
=======
      :department => nil,
      :user => nil
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
<<<<<<< HEAD
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Dep Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Facilitador/)
    expect(rendered).to match(/String/)
=======
    expect(rendered).to match(//)
    expect(rendered).to match(//)
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
  end
end
