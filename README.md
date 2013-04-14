# graphite [![Build Status](https://secure.travis-ci.org/hectcastro/chef-graphite.png?branch=master)](http://travis-ci.org/hectcastro/chef-graphite)

## Description

Installs and configures Graphite.  Much of the work in this cookbook reflects
work done by [Heavy Water Software](https://github.com/heavywater/chef-graphite)
and [Infochimps](https://github.com/infochimps-labs/ironfan-pantry/blob/master/cookbooks/graphite).

## Requirements

### Platforms

* CentOS 6
* Red Hat 6
* Ubuntu 11.10 (Oneiric)
* Ubuntu 12.04 (Precise)

### Cookbooks

* apache2
* logrotate
* python

## Attributes

* `node["graphite"]["version"]` - Version of Graphite to install.
* `node["graphite"]["user"]` - User for Graphite and its components.
* `node["graphite"]["group"]` - Group for Graphite and its components.
* `node["graphite"]["carbon"]["line_receiver_interface"]` - IP for the line
  receiver to bind to.
* `node["graphite"]["carbon"]["pickle_receiver_interface"]` - IP for the pickle
  receiver to bind to.
* `node["graphite"]["carbon"]["cache_query_interface"]` - IP for the query
  cache to bind to.
* `node["graphite"]["carbon"]["log_updates"]` - Enable/disable Carbon logging.
* `node["graphite"]["carbon"]["whisper_dir"]` - location of whisper
  (data) files.
* `node["graphite"]["dashboard"]["timezone"]` - Default dashboard timezone.
* `node["graphite"]["dashboard"]["memcache_hosts"]` - Array of IP and port pairs
  for memcached.
* `node["graphite"]["templates"]` - Additional template defintions
* `node["graphite"]["storage_schemas"]` - Array of hashes that define a storage
  schema.  See default attributes for an example.
* `node["graphite"]["storage_aggregation"]` – Array of hashes that define
  storage aggregation.  See default attributes for an example.

### Default Template Definition

* `default["graphite"]["templates"]["default"]["background"]`   = "black"
* `default["graphite"]["templates"]["default"]["foreground"]`   = "white"
* `default["graphite"]["templates"]["default"]["majorLine"]`    = "white"
* `default["graphite"]["templates"]["default"]["minorLine"]`    = "grey"
* `default["graphite"]["templates"]["default"]["lineColors"]`   = "blue,green,red,purple,brown,yellow,aqua,grey,magenta,pink,gold,rose"
* `default["graphite"]["templates"]["default"]["fontName"]`     = "Sans"
* `default["graphite"]["templates"]["default"]["fontSize"]`     = "10"
* `default["graphite"]["templates"]["default"]["fontBold"]`     = "False"
* `default["graphite"]["templates"]["default"]["fontItalic"]`   = "False"

## Recipes

* `recipe[graphite]` will install Graphite and all of its components.
* `recipe[graphite::carbon]` will install Carbon.
* `recipe[graphite::dashboard]` will install Graphite's dashboard.
* `recipe[graphite::whisper]` will install Whisper.

## Usage

Graphite's credentials default to username `root` and password `root` with an
e-mail address going no where.  Also, two schemas are provided by default:
`stats.*` for [StatsD](https://github.com/etsy/statsd) and a catchall that
matches anything.
