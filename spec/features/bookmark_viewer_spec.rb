require 'pg'

feature 'displays list of bookmarks' do
  scenario 'user sees a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    connection.exec("INSERT INTO bookmarks VALUES(1,'http://www.makersacademy.com/');")
    connection.exec("INSERT INTO bookmarks VALUES(2,'http://www.destroyallsoftware.com/');")
    connection.exec("INSERT INTO bookmarks VALUES(3,'http://www.google.com/');")

    visit '/bookmarks'
    expect(has_expected_content(page)).to be true
  end
  
end
