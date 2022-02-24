require 'rails_helper'

RSpec.describe Task, type: :model do
  
  context "association tests" do
    it { should belong_to(:user) }
  end

  

end
