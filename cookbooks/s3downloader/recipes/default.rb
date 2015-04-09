#download latest war file from s3 bucket and install under tomcat

execute "download_from_s3_and_install" do
  command "aws s3 cp --region ap-southeast-1 s3://mybuilds/AslamWebApp.war /var/lib/tomcat7/webapps/AslamWebApp.war"
end

# Restart tomcat after Deploying War file

service 'tomcat7' do
 action :restart
end
