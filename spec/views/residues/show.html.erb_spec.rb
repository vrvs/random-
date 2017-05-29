require 'rails_helper'

RSpec.describe "residues/show", type: :view do
  before(:each) do
    @residue = assign(:residue, Residue.create!(
      :name => "Name",
      :type => "Type",
      :blend => "Blend",
      :onu => "Onu",
      :code => "Code",
      :laboratory => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Blend/)
    expect(rendered).to match(/Onu/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
  end
end
