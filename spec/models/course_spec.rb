require 'rails_helper'

RSpec.describe Course, type: :model do
  it {should have_many(:students)}
  it {should have_many(:cohorts)}
  it {should belong_to(:teacher)}
  it {should have_many(:homeworks)}
end
