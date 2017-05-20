require 'rails_helper'

RSpec.describe "laboratories/show", type: :view do
  before(:each) do
    @laboratory = assign(:laboratory, Laboratory.create!(
      :name => "Name",
      :string => "String",
      :dep_name => "Dep Name",
      :string => "String",
      :facilitador => "Facilitador",
      :string => "String"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Dep Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Facilitador/)
    expect(rendered).to match(/String/)
  end
end
