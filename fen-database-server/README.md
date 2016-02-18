fen-database-server Cookbook
============================
Instantiate a database server (postgresql or percona/mysql).

Requirements
------------
#### cookbooks
- `percona` - fen-database-server sets up mysql for drupal, poptropica, redmine, etc.
- `postgresql` - fen-database-server sets up mysql for the reference sites.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### fen-database-server::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fen-database-server']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### fen-database-server::default
Installs percona libraries, server, and toolkit. Just include `fen-database-server`
in the setup recipes for your OpsWorks Layer or in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-database-server]"
  ]
}
```

#### fen-database-server::community
Installs fen-database-server::default after setting defaults for community sites.
Just include `fen-database-server` in the setup recipes for your OpsWorks Layer
or in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-database-server::community]"
  ]
}
```

#### fen-database-server::mysql-ebs-volume
Moves mysql directories on to a separate EBS store so new instances can be set up
to connect to existing databases and configurations instead of restoring from
backup. This is typically not called directly, but is used as a building block for
other recipes in this cookbook.

#### fen-database-server::mysql-on-ebs
Installs fen-database-server::default then runs fen-database-server::mysql-ebs-volume.

#### fen-database-server::redmine
Install redmine database.

License and Authors
-------------------
Authors:

* Erich Beyrent <erich.beyrent@fen.com>
* Karl DeBisschop <karl.debisschop@fen.com>