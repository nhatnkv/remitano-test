require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has many movies' do
    expect(
      described_class.reflect_on_association(:movies).macro
    ).to eq :has_many
  end
end
