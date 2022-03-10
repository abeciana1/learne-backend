require 'rails_helper'

RSpec.describe Task, type: :model do
  
  context "association tests" do
    it { should belong_to(:user) }
  end

  context "validation tests" do
    it { should validate_presence_of(:heading) }
    it { should validate_presence_of(:is_complete) }
  end

end
