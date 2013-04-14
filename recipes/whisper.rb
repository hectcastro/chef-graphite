python_pip "whisper" do
  version node["graphite"]["version"]
  action :install
end
