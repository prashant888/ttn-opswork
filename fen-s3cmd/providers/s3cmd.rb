action :get do
  execute 's3cmd-get' do
    if files.empty?
      command "/usr/bin/s3cmd -get s3://#{bucket} #{deploy_root}"
    else
      files.each do
        command "/usr/bin/s3cmd -get s3://#{bucket} #{deploy_root}"
      end
    end
  end
  
end
