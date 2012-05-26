require "minitest/autorun"
require "socket"

describe_recipe "graphite::carbon" do
  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources

  describe "files" do
    it "creates the configuration file" do
      file("/opt/graphite/conf/carbon.conf").must_exist
    end

    it "creates the storage schema configuration file" do
      file("/opt/graphite/conf/storage-schemas.conf").must_exist
    end

    it "creates the Upstart configuration file" do
      file("/etc/init/carbon-cache.conf").must_exist
    end

    it "changes the storage directory owner and group" do
      storage = directory("/opt/graphite/storage/")
      storage.must_have(:owner, node["apache"]["user"])
      storage.must_have(:group, node["apache"]["group"])
    end
  end

  describe "services" do
    it "runs as a daemon" do
      service("carbon-cache").must_be_running
    end

    it "accepts connections" do
      accepting_connections = false
      begin
        Timeout::timeout(1) do
          begin
            s = TCPSocket.new(node["graphite"]["carbon"]["line_receiver_interface"], 2003)
            s.close
          rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
            accepting_connections = true
          end
        end
      rescue Timeout::Error
      else
        accepting_connections = true
      end

      assert(accepting_connections)
    end
  end
end
