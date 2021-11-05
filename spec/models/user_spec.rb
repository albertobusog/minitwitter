require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:attributes) do 
      {
        username: 'Pedro',
        password: '1234',
        password_confirmation: '1234',
        full_name: 'Pedro Picapiedra'
      }      
    end

    subject { User.create(attributes).valid? }

    it { expect(subject).to be true }

    context 'username' do
      context 'is invalid when length is less than 2' do
        let(:attributes) do
          {
            username: 'P',
            password: '1234',
            password_confirmation: '1234',
            full_name: 'Pedro Picapiedra'
          }
        end

        it { expect(subject).to be false }
      end

      context 'is invalid when length is more than 10' do
        let(:attributes) do
          {
            username: 'PedroPicapiedra',
            password: '1234',
            password_confirmation: '1234',
            full_name: 'Pedro Picapiedra'
          }
        end

        it { expect(subject).to be false }
      end

      context 'is invalid if not unique' do
        before do
          User.create(attributes)
        end

        it { expect(subject).to be false }
      end

    end

  end

end
