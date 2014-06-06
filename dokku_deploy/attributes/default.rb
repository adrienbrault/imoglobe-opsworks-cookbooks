default['dokku']['root'] = '/home/dokku'

node[:deploy].each do |application, deploy|
  default[:deploy][application][:dokku_user] = deploy[:user]
end
