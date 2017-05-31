require 'rails_helper'

RSpec.describe "residues/show", type: :view do
  before(:each) do
    @residue = assign(:residue, Residue.create!(
      :name => "Name",
<<<<<<< HEAD
      :string => "String",
      :lab_name => "Lab Name",
      :string => "String",
      :weight => "Weight",
      :integer => "Integer",
      :type => "Type",
      :string => "String"
=======
      :type => "Type",
      :blend => "Blend",
      :onu => "Onu",
      :code => "Code",
      :laboratory => nil
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
<<<<<<< HEAD
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Lab Name/)
    expect(rendered).to match(/String/)
    expect(rendered).to match(/Weight/)
    expect(rendered).to match(/Integer/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/String/)
=======
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Blend/)
    expect(rendered).to match(/Onu/)
    expect(rendered).to match(/Code/)
    expect(rendered).to match(//)
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
  end
end
