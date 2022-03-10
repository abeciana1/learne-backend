require 'rails_helper'

RSpec.describe Block, type: :model do
  
  context "association tests" do
    it { should belong_to(:note) }
  end

  context "validation tests" do
    it { should validate_uniqueness_of(:block_data_id) }
    it { should validate_presence_of(:block_type) }
    it { should validate_presence_of(:block_content) }
  end

end
