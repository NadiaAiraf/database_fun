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
    empty_database
    add_bookmarks
    visit '/bookmarks'
    expect(page).to have_content "google"
    expect(page).to have_content 'facebook'
    expect(page).to have_content 'twitter'
    expect(page).to have_content 'youtube'
  end
end
