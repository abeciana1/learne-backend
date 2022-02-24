require 'rails_helper'

RSpec.describe Cohort, type: :model do
  
  context 'association tests' do
    it { should belong_to(:student) }
    it { should belong_to(:course) }
    it { should have_many(:lectures) }
  end

  context "validation tests" do
    it { should validate_presence_of(:student_id) }
    it { should validate_presence_of(:course_id) }
    it { should validate_numericality_of(:student_id) }
    it { should validate_numericality_of(:course_id) }
  end

end
