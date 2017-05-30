require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :generate_for => 2,
        :f_unit => false,
        :f_state => false,
        :f_kind => false,
        :f_onu => false,
        :f_blend => false,
        :f_code => false,
        :f_total => "",
        :collection => nil
      ),
      Report.create!(
        :generate_for => 2,
        :f_unit => false,
        :f_state => false,
        :f_kind => false,
        :f_onu => false,
        :f_blend => false,
        :f_code => false,
        :f_total => "",
        :collection => nil
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
