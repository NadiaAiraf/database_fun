feature 'adding and viewing comments' do
  feature 'a user can add more than one comment to a bookmark' do
    scenario 'a comment is added to a bookmark' do
      visit '/bookmarks'
      find('#1_comment').click
      fill_in 'text',with: 'google is freaking awesome'
      click_button 'submit'
      expect(page).to have_content 'google is freaking awesome'
    end
  end
end
