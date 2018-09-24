feature 'homepage' do
  scenario 'has the hello world text upon' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end
end

feature 'bookmarks' do
  scenario 'there is a bookmarks page' do
    visit '/bookmarks'
    expect(page).to have_content 'List of bookmarks'
  end

  scenario 'it shows a list of current bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "bookmark1, bookmark2"
  end
end
