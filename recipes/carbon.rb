python_pip "carbon" do
  version node["graphite"]["version"]
  action :install
end

template "/opt/graphite/conf/carbon.conf" do
  mode "0644"
  source "carbon.conf.erb"
  owner node["graphite"]["user"]
  group node["graphite"]["group"]
  variables(
    :line_receiver_interface    => node["graphite"]["carbon"]["line_receiver_interface"],
    :pickle_receiver_interface  => node["graphite"]["carbon"]["pickle_receiver_interface"],
    :cache_query_interface      => node["graphite"]["carbon"]["cache_query_interface"]
  )
  notifies :restart, "service[carbon-cache]"
end

template "/opt/graphite/conf/storage-schemas.conf" do
  mode "0644"
  source "storage-schemas.conf.erb"
  owner node["graphite"]["user"]
  group node["graphite"]["group"]
end

execute "chown" do
  command "chown -R #{node["graphite"]["user"]}:#{node["graphite"]["group"]} /opt/graphite/storage"
  only_if do
    f = File.stat("/opt/graphite/storage")
    f.uid == 0 && f.gid == 0
  end
end

cookbook_file "/opt/graphite/storage/graphite.db" do
  mode "0644"
  owner node["graphite"]["user"]
  group node["graphite"]["group"]
  action :create_if_missing
end

template "/etc/init/carbon-cache.conf" do
  mode "0644"
  source "carbon-cache.conf.erb"
  variables(:user => node["graphite"]["user"])
end

service "carbon-cache" do
  provider Chef::Provider::Service::Upstart
  action [ :enable, :start ]
end
