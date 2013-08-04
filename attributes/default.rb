default["graphite"]["version"]                              = "0.9.10"
default["graphite"]["home"]                                 = "/opt/graphite"
default["graphite"]["carbon"]["line_receiver_interface"]    = "127.0.0.1"
default["graphite"]["carbon"]["pickle_receiver_interface"]  = "127.0.0.1"
default["graphite"]["carbon"]["cache_query_interface"]      = "127.0.0.1"
default["graphite"]["carbon"]["log_updates"]                = true
default["graphite"]["carbon"]["whisper_dir"]                = "#{node["graphite"]["home"]}/storage/whisper"
default["graphite"]["carbon"]["max_cache_size"]             = "inf"
default["graphite"]["carbon"]["max_creates_per_minute"]     = "inf"
default["graphite"]["carbon"]["max_updates_per_second"]     = "1000"
default["graphite"]["dashboard"]["timezone"]                = "America/New_York"
default["graphite"]["dashboard"]["memcache_hosts"]          = [ "127.0.0.1:11211" ]
default["graphite"]["dashboard"]["mysql_server"]            = ""
default["graphite"]["dashboard"]["mysql_port"]              = ""
default["graphite"]["dashboard"]["mysql_username"]          = ""
default["graphite"]["dashboard"]["mysql_password"]          = ""

# The default values template
default["graphite"]["templates"]["default"]["background"]   = "black"
default["graphite"]["templates"]["default"]["foreground"]   = "white"
default["graphite"]["templates"]["default"]["majorLine"]    = "white"
default["graphite"]["templates"]["default"]["minorLine"]    = "grey"
default["graphite"]["templates"]["default"]["lineColors"]   = "blue,green,red,purple,brown,yellow,aqua,grey,magenta,pink,gold,rose"
default["graphite"]["templates"]["default"]["fontName"]     = "Sans"
default["graphite"]["templates"]["default"]["fontSize"]     = "10"
default["graphite"]["templates"]["default"]["fontBold"]     = "False"
default["graphite"]["templates"]["default"]["fontItalic"]   = "False"

#Storage Schemas
default["graphite"]["storage_schemas"] = [
  {
    :stats => {
      :priority   => "100",
      :pattern    => "^stats\\..*",
      :retentions => "10s:7d,1m:31d,10m:5y"
    }
  },
  {
    :catchall => {
      :priority   => "0",
      :pattern    => "^.*",
      :retentions => "60s:5y"
    }
  }
]

#Storage Aggregation
default["graphite"]["storage_aggregation"] = [
  {
    :min => {
      :pattern            => "\\.min$",
      :xFilesFactor       => "0.1",
      :aggregationMethod  => "min"
    }
  },
  {
    :max => {
      :pattern            => "\\.max$",
      :xFilesFactor       => "0.1",
      :aggregationMethod  => "max"
    }
  },
  {
    :sum => {
      :pattern            => "\\.count$",
      :xFilesFactor       => "0",
      :aggregationMethod  => "sum"
    }
  },
  {
    :default_average => {
      :pattern            => ".*",
      :xFilesFactor       => "0.3",
      :aggregationMethod  => "average"
    }
  }
]




