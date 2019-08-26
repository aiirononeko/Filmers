require 'rails_helper'

describe 'ユーザー登録機能', type: :system do
  before do
    user_a = FactoryBot.create(:user, id: 1, name: 'taro', email: 'taro@gmail.com', password: 'password')
  end

  describe '新規登録機能' do
    context '新規登録画面からユーザー情報を送信した時' do
      before do
        visit new_user_path
        fill_in 'ユーザー名', with: 'jiro'
        fill_in 'メールアドレス', with: 'jiro@gmail.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録'
      end

      it 'ユーザーが新規作成される' do
        expect(page).to have_content 'jiroさん、Filmersへようこそ！'
      end
    end
  end

  describe 'ユーザー情報詳細表示機能' do
    context 'ログインした状態でマイページにアクセスした時' do
      before do
        visit login_url
        fill_in 'メールアドレス', with: 'taro@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'

        visit user_path(1)
      end

      it '詳細情報が表示される' do
        expect(page).to have_content 'taro'
      end
    end
  end

  describe 'ユーザー情報編集機能' do
    context 'ユーザー情報編集画面から編集したユーザー情報を送信した時' do
      before do
        visit login_url
        fill_in 'メールアドレス', with: 'taro@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'

        visit edit_user_path(1)

        fill_in 'ユーザー名', with: 'taro_updated'
        fill_in 'メールアドレス', with: 'taro_updated@gmail.com'
        fill_in 'パスワード', with: 'password'
        fill_in 'パスワード（確認）', with: 'password'
        click_button '登録'
      end

      it 'ユーザー情報が更新される' do
        expect(page).to have_content 'taro_updated'
      end
    end
  end

  describe 'ユーザー情報削除機能' do
    context 'ユーザー情報詳細画面から、削除リンクを踏んだ時' do
      before do
        visit login_url
        fill_in 'メールアドレス', with: 'taro@gmail.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログイン'

        visit user_path(1)
        click_link '退会する'
        page.driver.browser.switch_to.alert.accept
      end

      it 'ユーザー情報が削除される' do
        expect(page).to have_content 'taroさんのアカウントを削除しました'
      end
    end
  end
end
