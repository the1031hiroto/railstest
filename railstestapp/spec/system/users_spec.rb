require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    #@user = User.create!(name: 'いとう')
  end

  it 'test' do
    # ログイン画面を開く
    visit login_index_path

    # Nameに"いとう"が入力されていることを検証する
    #expect(page).to have_field '名前', with: 'いとう'

    # usernameを入力
    fill_in 'username', with: 'hiroto'
    fill_in 'password', with: 'pass'
    #expect(page).to have_field '住所', with: '東京都世田谷区奥沢'

    # 更新実行
    click_button 'ログイン'
  end
end