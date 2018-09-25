feature 'delete bookmarks' do
  scenario 'removes a bookmark from the list' do
    visit '/bookmarks'
    find('#1').click
    visit '/bookmarks'
    expect(page).to_not have_content 'aidan'
  end
end
