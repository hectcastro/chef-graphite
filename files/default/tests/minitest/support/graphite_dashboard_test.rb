require "minitest/autorun"
require "net/http"
require "uri"

describe_recipe "graphite::dashboard" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "packages" do
    it "installs the Python dependency packages" do
      [ "python-cairo-dev", "python-django", "python-django-tagging", "python-memcache", "python-rrdtool" ].each do |graphite_package|
        package(graphite_package).must_be_installed
      end
    end
  end

  describe "files" do
    it "creates the configuration file" do
      file("#{node['graphite']['home']}/webapp/graphite/local_settings.py").must_exist
    end

    it "creates the log storage directory" do
      directory("#{node['graphite']['home']}/storage/log/").must_exist
    end

    it "creates the whisper storage directory" do
      directory("#{node['graphite']['home']}/storage/whisper/").must_exist
    end

    it "creates the webapp log storage directory" do
      directory("#{node['graphite']['home']}/storage/log/webapp/").must_exist
    end

    it "creates the Graphite user database" do
      file("#{node['graphite']['home']}/storage/graphite.db").must_exist
    end
  end

  describe "services" do
    it "runs apache" do
      service("apache2").must_be_running
    end

    it "responds to requests" do
      response = Net::HTTP.get_response(URI.parse("http://localhost"))
      assert(response.body =~ /Graphite Browser/)
    end
  end
end

