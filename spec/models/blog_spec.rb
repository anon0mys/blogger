require 'rails_helper'

RSpec.describe Blog, type: :model do
  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  context 'relationships' do
    it { should belong_to :user }
  end
end
