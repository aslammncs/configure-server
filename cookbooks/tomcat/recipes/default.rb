#install package we need

package 'tomcat7'

# deploy configuration file

service 'tomcat7' do
 action :install
end
