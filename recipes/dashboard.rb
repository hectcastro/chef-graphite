include_recipe "apache2::mod_python"

[ "python-cairo-dev", "python-django", "python-django-tagging", "python-memcache", "python-rrdtool" ].each do |graphite_package|
  package graphite_package do
    action :install
  end
end

python_pip "graphite-web" do
  version node["graphite"]["version"]
  action :install
end

template "/etc/apache2/sites-available/graphite" do
  mode "0644"
  source "graphite.conf.erb"
  notifies :restart, "service[apache2]"
end

apache_site "000-default" do
  enable false
end

apache_site "graphite"

directory "/opt/graphite/storage/log" do
  owner node["graphite"]["user"]
  group node["graphite"]["group"]
end

directory "/opt/graphite/storage/log/webapp" do
  owner node["graphite"]["user"]
  group node["graphite"]["group"]
end

directory "/opt/graphite/storage/whisper" do
  owner node["graphite"]["user"]
  group node["graphite"]["group"]
end

cookbook_file "/opt/graphite/storage/graphite.db" do
  owner node["graphite"]["user"]
  group node["graphite"]["group"]
  action :create_if_missing
end
