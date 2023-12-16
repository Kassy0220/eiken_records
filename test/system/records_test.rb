# frozen_string_literal: true

require 'application_system_test_case'

class RecordsTest < ApplicationSystemTestCase
  test 'user can create record' do
    visit new_record_url
    assert_selector 'h1', text: '記録作成'

    fill_in 'record[test_date]', with: '002023-09-30'
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
    assert_text '受験日 : 2023-09-30'
    assert_text '級 : 二級'
    assert_text '一次試験 : 合格'
    assert_text '二次試験 : 不合格'
    assert_text '結果 : 不合格'
    assert_text 'リーディング : 600'
    assert_text 'ライティング : 600'
    assert_text 'リスニング : 600'
    assert_text 'スピーキング : 400'
  end

  test 'user can see record list and each record' do
    visit '/'
    assert_selector 'h1', text: '記録一覧'
    assert_selector 'li', count: Record.count
    Record.find_each do |record|
      assert_link "#{I18n.t(record.grade)} (#{record.test_date})", href: record_path(record)
    end

    click_on '五級 (2023-05-26)'
    assert_selector 'h1', text: '記録詳細'
    assert_text '受験日 : 2023-05-26'
    assert_text '級 : 五級'
    assert_text '一次試験 : 合格'
    assert_text '二次試験 : 合格'
    assert_text '結果 : 合格'
    assert_text 'リーディング : 420'
    assert_text 'リスニング : 420'
    assert_text 'スピーキング : 300'
  end

  test 'user can edit record' do
    record = records(:fail_pre_second)
    visit record_path(record)
    assert_text '受験日 : 2023-09-29'
    assert_text '級 : 準二級'
    assert_text '一次試験 : 合格'
    assert_text '二次試験 : 不合格'
    assert_text '結果 : 不合格'
    assert_text 'リーディング : 500'
    assert_text 'ライティング : 500'
    assert_text 'リスニング : 500'
    assert_text 'スピーキング : 350'

    click_on '編集'
    assert_selector 'h1', text: '記録編集'
    fill_in 'record[test_date]', with: '002023-10-01'
    select '二級', from: '級'
    select '免除', from: '一次試験'
    select '合格', from: '二次試験'
    select '合格', from: '結果'
    fill_in 'リーディング', with: ''
    fill_in 'ライティング', with: ''
    fill_in 'リスニング', with: ''
    fill_in 'スピーキング', with: '500'
    click_on '更新'

    assert_selector 'h1', text: '記録詳細'
    assert_text '受験日 : 2023-10-01'
    assert_text '級 : 二級'
    assert_text '一次試験 : 免除'
    assert_text '二次試験 : 合格'
    assert_text '結果 : 合格'
    assert_text 'リーディング :'
    assert_text 'ライティング :'
    assert_text 'リスニング :'
    assert_text 'スピーキング : 500'
  end

  test 'user can delete record' do
    visit '/'
    assert_link '五級 (2023-05-26)'

    click_on '五級 (2023-05-26)'

    assert_difference 'Record.count', -1 do
      accept_confirm do
        click_on '削除'
      end
      assert_selector 'h1', text: '記録一覧'
    end

    assert_no_link '五級 (2023-05-26)'
  end
end
