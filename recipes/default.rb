include_recipe "yum::epel"
include_recipe "python"
include_recipe "build-essential"
include_recipe "logrotate"

include_recipe "graphite::whisper"
include_recipe "graphite::dashboard"
include_recipe "graphite::carbon"
