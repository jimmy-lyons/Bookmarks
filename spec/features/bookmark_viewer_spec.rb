feature 'displays list of bookmarks' do
  # scenario 'user requests list of bookmarks' do
  #   visit '/bookmarks'
  #   expect(page).to have_content('Makers Academy')
  # end

  scenario 'user requests list of bookmarks' do
    visit '/bookmarks'
    expect(has_expected_content(page)).to be true
  end
end