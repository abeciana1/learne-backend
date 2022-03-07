require 'rails_helper'

RSpec.describe Lecture, type: :model do
  
  context "association tests" do
    it { should belong_to(:cohort) }
  end

  context "validation tests" do
    it { should validate_presence_of(:meeting_time) }
    it { should validate_presence_of(:meeting_link) }
    it { should validate_presence_of(:meeting_name) }
    it { should validate_presence_of(:meeting_description) }
  end

end
