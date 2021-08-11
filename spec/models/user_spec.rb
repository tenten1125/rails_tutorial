require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのチェック' do
    subject { user.valid? }

    context '適切なデータのとき' do
      let(:user) { build(:user) }
      it '有効なユーザーである' do
        expect(subject).to eq true
      end
    end
    context 'nameが空のとき' do
      let(:user) { build(:user, name: '') }
      it '保存されない' do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include 'を入力してください'
      end
    end
    context 'nameが51文字以上のとき' do
      let(:user) { build(:user, name: 'a' * 51) }
      it '保存されない' do
        expect(subject).to eq false
        expect(user.errors.messages[:name]).to include 'は50文字以内で入力してください'
      end
    end
    context 'emailが空のとき' do
      let(:user) { build(:user, email: '') }
      it '保存されない' do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include 'を入力してください'
      end
    end
    context 'emailが255文字以上のとき' do
      let(:user) { build(:user, email: 'a' * 256) }
      it '保存されない' do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include 'は255文字以内で入力してください'
      end
    end
    context '不正なemailのとき' do
      let(:user) { build(:user, email: Faker::Lorem.characters(number: 16)) }
      it '保存されない' do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include 'は不正な値です'
      end
    end
    context 'emailがすでに存在するとき' do
      before { create(:user, email: 'test@example.com') }
      let(:user) { build(:user, email: 'test@example.com') }
      it 'エラーが発生する' do
        expect(subject).to eq false
        expect(user.errors.messages[:email]).to include 'はすでに存在します'
      end
    end
  end
end
