feature 'updating bookmarks' do
  scenario 'change a bookmark url' do
    visit '/bookmarks'
    find('#1_edit').click
    fill_in 'url', with: 'jon'
    click_button 'Submit'
    expect(page).to have_content 'jon'
  end
end
