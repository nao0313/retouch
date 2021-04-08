require 'rails_helper'

RSpec.describe Fix, type: :model do
  before do
    user = FactoryBot.create(:user)
    @fix = FactoryBot.build(:fix, user_id: user.id)
  end


  describe 'リクエストの作成' do
    context 'リクエスト作成できるとき' do
      it 'title,comment,genre_id,imageが存在している' do
        expect(@fix).to be_valid
      end
      it 'genre_idが1意外なら登録できる' do
        @fix.genre_id = 3
        expect(@fix).to be_valid
      end
    end
    
    context 'リクエスト作成できない時' do
      it 'titleが空だと保存できない' do
        @fix.title = ''
        @fix.valid?
        expect(@fix.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'commentが空だと保存できない' do
        @fix.comment = ''
        @fix.valid?
        expect(@fix.errors.full_messages).to include("コメントを入力してください")
      end
      it 'imageが空だと保存できない' do
        @fix.image = nil
        @fix.valid?
        expect(@fix.errors.full_messages).to include("画像を入力してください", "画像は不正な値です")
      end
      it 'genre_idが空だと保存できない' do
        @fix.genre_id = ''
        @fix.valid?
        expect(@fix.errors.full_messages).to include("ジャンルを入力してください", "ジャンルは数値で入力してください")
      end
      it 'user_idが空だと保存できない' do
        @fix.user_id = ''
        @fix.valid?
        expect(@fix.errors.full_messages).to include("Userを入力してください")
      end
      it 'genre_idを選択してないと保存できない' do
        @fix.genre_id = 1
        @fix.valid?
        expect(@fix.errors.full_messages).to include("ジャンルは1以外の値にしてください")
      end

    end


  end
end
