include_recipe "python"
include_recipe "logrotate"
include_recipe "yum::epel" if platform_family?("rhel")

include_recipe "graphite::whisper"
include_recipe "graphite::dashboard"
include_recipe "graphite::carbon"
