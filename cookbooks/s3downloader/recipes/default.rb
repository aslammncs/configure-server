# Stop tomcat before deploying War file

service 'tomcat7' do
 action :stop
end

# delete existing exploaded war directory
directory "/var/lib/tomcat7/webapps/AslamWebApp" do
 recursive true
 action :delete
end

#download latest war file from s3 bucket and deploy under webapps directory
execute "download_from_s3_and_install" do
  command "aws s3 cp --region ap-southeast-1 s3://mybuilds/AslamWebApp.war /var/lib/tomcat7/webapps/AslamWebApp.war"
end

# start tomcat
service 'tomcat7' do
 action :start
end
