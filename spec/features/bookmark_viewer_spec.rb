require 'pg'

feature 'displays list of bookmarks' do
  scenario 'user sees a list of bookmarks' do

    Bookmarks.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    Bookmarks.create(url: 'http://www.destroyallsoftware.com/', title: 'Destroy All Software')
    Bookmarks.create(url: 'http://www.google.com/', title: 'Google')

    visit '/bookmarks'
    expect(has_expected_content(page)).to be true
  end
  
end
