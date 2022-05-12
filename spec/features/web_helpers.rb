public

def has_expected_content(page)
  array = [
    'Makers Academy',
    'Destroy All Software',
    'Google']
  array.all? do |name|
    page.has_content?(name)
  end
end


