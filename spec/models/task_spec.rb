require 'rails_helper'

# Test suite for the Todo model
RSpec.describe Task, type: :model do
# Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:project) }
  # Validation tests
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end