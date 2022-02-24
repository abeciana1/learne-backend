require 'rails_helper'

RSpec.describe Lecture, type: :model do
  it { should belong_to(:cohort) }
end
