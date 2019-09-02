require 'rails_helper'

RSpec.describe Movie, type: :model do
  it 'belongs to a user' do
    expect(
      described_class.reflect_on_association(:user).macro
    ).to eq :belongs_to
  end
end
