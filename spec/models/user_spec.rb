require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:picture) }
  end

  describe '#picture' do
    subject { create(:user).picture }

    it { is_expected.to be_an_instance_of(ActiveStorage::Attached::One) }
  end
end
