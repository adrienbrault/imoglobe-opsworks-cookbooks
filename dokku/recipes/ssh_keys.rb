file "#{node['dokku']['root']}/.ssh/authorized_keys" do
  	action :delete

  	only_if do
      	::File.exists?("#{node['dokku']['root']}/.ssh/authorized_keys")
    end
end

node['dokku']['ssh_keys'].each do |user, key|
  	# TODO make this into an LWRP
  	bash "sshcommand_acl-add_key" do
    	cwd node['dokku']['root']
    	code <<-EOT
      		echo '#{key}' | sshcommand acl-add dokku #{user}
    	EOT
  	end
end
