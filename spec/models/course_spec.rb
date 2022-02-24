require 'rails_helper'

RSpec.describe Course, type: :model do


  context "association tests" do
    it {should have_many(:students)}
    it {should have_many(:cohorts)}
    it {should belong_to(:teacher)}
    it {should have_many(:homeworks)}
  end

  context "validation tests" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:teacher_id) }
    it { should validate_numericality_of(:price) }
    it { should validate_numericality_of(:teacher_id) }
  end

end
