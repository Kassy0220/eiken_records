# frozen_string_literal: true

require 'application_system_test_case'

class RecordsTest < ApplicationSystemTestCase
  test 'user can create record' do
    visit new_record_url
    assert_selector 'h1', text: '記録作成'

    fill_in 'record[test_date]', with: '002023-09-29'
    select '二級', from: '級'
    select '合格', from: '一次試験'
    select '不合格', from: '二次試験'
    select '不合格', from: '結果'
    fill_in 'リーディング', with: '600'
    fill_in 'ライティング', with: '600'
    fill_in 'リスニング', with: '600'
    fill_in 'スピーキング', with: '400'
    click_on '作成'

    assert_selector 'h1', text: '記録詳細'
    assert_text '受験日 : 2023-09-29'
    assert_text '級 : 二級'
    assert_text '一次試験 : 合格'
    assert_text '二次試験 : 不合格'
    assert_text '結果 : 不合格'
    assert_text 'リーディング : 600'
    assert_text 'ライティング : 600'
    assert_text 'リスニング : 600'
    assert_text 'スピーキング : 400'
  end
end
