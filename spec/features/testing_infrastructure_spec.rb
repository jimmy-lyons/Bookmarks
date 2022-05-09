feature 'testing infrastructure' do
  scenario 'has title Bookmark Manager' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end
end