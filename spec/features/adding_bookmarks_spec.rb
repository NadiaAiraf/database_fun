feature 'add a bookmark' do
  scenario 'add a bookmark and see it in bookmark list' do
    visit '/bookmark'
    fill_in 'url',with 'www.drawingablank.com'
    click_button 'submit'
    expect(page).to have_content 'www.drawingablank.com'
  end
end
