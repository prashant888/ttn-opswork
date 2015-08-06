file = Chef::Util::FileEdit.new('/test.txt')
file.insert_line_if_no_match(/#{line}/, line)
file.write_file
