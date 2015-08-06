line = "rv123345	ALL=(ALL) ALL"
file = Chef::Util::FileEdit.new('/etc/sudoers')
file.insert_line_if_no_match(/#{line}/, line)
file.write_file
