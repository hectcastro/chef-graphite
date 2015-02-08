## v0.2.0

* Add attribute to supplying port Graphite Web is bound to.
* Add support for Apache 2.4.

## v0.1.6

* Add `twisted_version` to explicitly set a version of Twisted prior to
  installing Carbon.
* Make use of `yum-epel` cookbook to enable EPEL repository.
* Update Test Kitchen suite.

## v0.1.5

* Fixed lost reference to `@home` for RRD storage in `local_settings.py` due
  to a bad merge.

## v0.1.4

* Added MySQL configuration attributes for dashboard.
* Added Carbon update limit attributes.

## v0.1.3

* Added zope.interface dependency for Twisted.

## v0.1.2

* Fixed bad reference to `whisper_dir` within cookbooks.

## v0.1.1

* Added support for Amazon Linux.

## v0.1.0

* Added test-kitchen support.
* Added CentOS and RHEL support.
* Added custom prefix for Graphite installation.
* Added custom Whisper data directory.

## v0.0.16

* Fixed a bug in storage aggregation matching patterns.

## v0.0.15

* Added attribute driven storage schema and storage aggregation templates.

## v0.0.14

* Fixed Django missing database definition error.

## v0.0.13

* Added support for templating Carbon log updates.

## v0.0.12

* Added support for templating storage-aggregation.conf.

## v0.0.11

* Fixed a bug with the Carbon logrotate directive.

## v0.0.10

* Added CORS support to Graphite Apache configuration.

## v0.0.9

* Added graph template configuration support.

## v0.0.8

* Added Graphite `0.9.10` support.

## v0.0.7

* Added Foodcritic and Travis CI.
