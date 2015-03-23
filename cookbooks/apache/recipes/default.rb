#install package we need

package 'apache2'

# deploy configuration file

#cookbook_file '/etc/apache2/apache2.conf'

service 'apache2' do
 action :restart
end
