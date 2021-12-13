require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Project, type: :model do
  # Association test
  # Validation tests
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end