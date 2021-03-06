require "spec_helper"

describe Openhbx::Cv2::PolicyEnrollmentShopMarket, "given a sample xml" do
  let(:total_employer_responsible_amount) { "93.24" }
  let(:composite_rating_tier_name) { "A COMPOSITE RATING TIER NAME" }
  let(:cobra_eligibility_date) { "20171001" }

  let(:input_xml) { 
<<-XMLDOC
<?xml version='1.0' encoding='utf-8' ?>
<shop_market xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns='http://openhbx.org/api/terms/1.0'>
  <employer_link />
  <total_employer_responsible_amount>#{total_employer_responsible_amount}</total_employer_responsible_amount>
  <cobra_eligibility_date>#{cobra_eligibility_date}</cobra_eligibility_date>
  <composite_rating_tier_name>#{composite_rating_tier_name}</composite_rating_tier_name>
</shop_market>
XMLDOC
  }

  subject { Openhbx::Cv2::PolicyEnrollmentShopMarket.parse(input_xml, single: true) }

  it "has the correct total_employer_responsible_amount" do
    expect(subject.total_employer_responsible_amount).to eq total_employer_responsible_amount
  end

  it "has the correct composite_rating_tier_name" do
    expect(subject.composite_rating_tier_name).to eq composite_rating_tier_name
  end

  it "has the correct cobra_eligibility_date" do
    expect(subject.cobra_eligibility_date).to eq cobra_eligibility_date
  end

  it "has an employer link" do
    expect(subject.employer_link).to be_a_kind_of(Openhbx::Cv2::EmployerLink)
  end
end
