require 'rails_helper'

RSpec.describe 'Users', type: :system do
  before do
    @user = User.create!(username: 'hiroto', password: 'pass')
  end

  it 'test' do
    # ログイン画面を開く
    visit login_index_path

    # Nameに"いとう"が入力されていることを検証する
    #expect(page).to have_field '名前', with: 'いとう'

    # usernameを入力
    fill_in 'username', with: 'hiroto'
    expect(page).to have_field 'username', with: 'hiroto'
    fill_in 'password', with: 'pass'
    expect(page).to have_field 'password', with: 'pass'

    # 更新実行
    click_button 'ログイン'
    # ログインに成功したことを検証する
    expect(page).to have_content 'Books'
  end
end