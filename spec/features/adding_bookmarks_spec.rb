feature 'add a bookmark' do
  scenario 'add a bookmark and see it in bookmark list' do
    visit '/bookmark'
    fill_in 'url', with: 'http://www.drawingablank.com'
    fill_in 'title', with: 'drawingablank'
    click_button 'submit'
    expect(page).to have_content 'drawingablank'
    # expect(page).to have_link 'http://www.drawingablank.com'
  end

  scenario 'add a bookmark that isnt a proper url' do
    visit '/bookmark'
    fill_in 'url', with: 'aeghoiejt'
    click_button 'submit'
    expect(page).to have_content 'You must submit a valid URL, dumbass'
  end
end
