public

def has_expected_content(page)
  array = ['http://www.makersacademy.com/', 
    'http://www.destroyallsoftware.com/', 
    'http://www.google.com/',
    'Makers Academy',
    'Destroy All Software',
    'Google']
  array.all? do |name|
    page.has_content?(name)
  end
end


