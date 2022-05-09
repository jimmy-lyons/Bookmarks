public

def has_expected_content(page)
  array = ['Makers Academy', 'Google', 'BBC']
  array.all? do |name|
    page.has_content?(name)
  end
end