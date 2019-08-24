require 'rails_helper'

describe '画像投稿機能', type: :system do

  before do
    photo_a = FactoryBot.create(:photo, title: 'テスト')
  end

  describe '一覧表示機能' do
    context '一覧表示ページにアクセスした時' do
      before do
        visit photos_path
      end

      it '投稿一覧が表示される' do
        expect(page).to have_content 'テスト'
      end
    end
  end

  # describe '詳細表示機能' do
  #   context '詳細表示画面にアクセスした時' do
  #     before do
  #       visit photo_path
  #     end

  #     it '個展の詳細が表示される' do
  #       expect(page).to have_content 'テスト', photo_a.description, photo_a.created_at
  #     end
  #   end
  # end

  describe '新規投稿機能' do
    context '新規投稿画面でフォームを送信した時' do
      before do
        visit new_photo_path
        fill_in '個展名', with: 'new'
        fill_in '説明', with: 'testtesttest'
        click_button '投稿'
      end

      it '送信した内容が保存される' do
        expect(page).to have_content 'new'
      end
    end
  end

  # describe '編集機能' do
  #   context '編集画面でフォームを送信した時' do
  #     before do
  #       visit edit_photo_path()
  #       fill_in '個展名', with: 'updated'
  #       fill_in '説明', with: 'testtesttest'
  #       click_button '投稿'
  #     end

  #     it '送信した内容が保存される' do
  #       expect(page).to have_content 'updated'
  #     end
  #   end
  # end
end
