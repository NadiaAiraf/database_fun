feature 'homepage' do
  scenario 'has the hello world text upon' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end
end
