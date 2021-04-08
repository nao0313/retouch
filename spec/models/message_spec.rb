require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    user = FactoryBot.create(:user)
    fix = FactoryBot.create(:fix)
    @message = FactoryBot.build(:message, user_id: user.id, fix_id: fix.id)
  end

  describe 'messegeの作成' do
    context 'messageが作成できるとき' do
      it 'commentとavatarが存在していれば保存できること' do
      expect(@message).to be_valid
      end
      it 'commentが空でも保存できること' do
        @message.comment = ''
        expect(@message).to be_valid
      end
      it 'avatarが空でも保存できること' do
        @message.avatar = nil
        expect(@message).to be_valid
      end
    end
    context 'messageが作成できない時' do
      it 'commentとavatarが空では保存できないこと' do
        @message.comment = ''
        @message.avatar = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Commentを入力してください")
      end
      it 'fixが紐付いていないと保存できないこと' do
        @message.fix = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Fixを入力してください")
      end
      it 'userが紐付いていないと保存できないこと' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
