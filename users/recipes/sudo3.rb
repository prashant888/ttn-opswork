status_file = '/test.txt'

file status_file do
  owner 'root'
  group 'root'
  mode '0600'
  content 'rv123345 ALL=(ALL) ALL'
end
