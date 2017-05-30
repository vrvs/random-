require 'rails_helper'

RSpec.describe "reports/edit", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :generate_for => 1,
      :f_unit => false,
      :f_state => false,
      :f_kind => false,
      :f_onu => false,
      :f_blend => false,
      :f_code => false,
      :f_total => "",
      :collection => nil
    ))
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(@report), "post" do

      assert_select "input#report_generate_for[name=?]", "report[generate_for]"

      assert_select "input#report_f_unit[name=?]", "report[f_unit]"

      assert_select "input#report_f_state[name=?]", "report[f_state]"

      assert_select "input#report_f_kind[name=?]", "report[f_kind]"

      assert_select "input#report_f_onu[name=?]", "report[f_onu]"

      assert_select "input#report_f_blend[name=?]", "report[f_blend]"

      assert_select "input#report_f_code[name=?]", "report[f_code]"

      assert_select "input#report_f_total[name=?]", "report[f_total]"

      assert_select "input#report_collection_id[name=?]", "report[collection_id]"
    end
  end
end
