feature 'updating bookmarks' do
  scenario 'change a bookmark url' do
    visit '/bookmarks'
    find('#1_edit').click
    fill_in 'url', with: 'http://www.ilikebigbuttsandicannotlie.com'
    fill_in 'title', with: 'Sir Mixalot'
    click_button 'Submit'
    expect(page).to have_content 'Sir Mixalot'
  end
end
