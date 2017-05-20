require 'rails_helper'

RSpec.describe "residues/show", type: :view do
  before(:each) do
    @residue = assign(:residue, Residue.create!(
      :name => "Name",
      :string => "String",
      :lab_name => "Lab Name",
      :string => "String",
      :weight => "Weight",
      :integer => "Integer",
      :type => "Type",
      :string => "String"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Lab Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Weight/)
    expect(rendered).to match(/Integer/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/String/)
  end
end
