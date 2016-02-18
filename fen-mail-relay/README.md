fen-mail-relay Cookbook
============================
Instantiate a mail relay.


Requirements
------------
#### cookbooks
- `fen-base-server` - fen-base-server sets up default policies and packages.

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
    <td><tt>['postfix']['main']['mydomain']</tt></td>
    <td>String</td>
    <td>Set mail domain</td>
    <td><tt>fen.com</tt></td>
  </tr>
  <tr>
    <td><tt>['postfix']['main']['myorigin']</tt></td>
    <td>String</td>
    <td>Set mail origin domain</td>
    <td><tt>fen.com</tt></td>
  </tr>
</table>

-----
#### fen-mail-relay::default

Don't use this for now -- it will eventually be an alias for client since that is most common.
But it is not set up yet.

#### fen-mail-relay::client

Just include `fen-mail-relay::client` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-mail-relay::client]"
  ]
}
```
#### fen-mail-relay::server

Include `fen-mail-relay::server` in your node's `run_list`

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-mail-relay::server]"
  ]
}
```

License and Authors
-------------------
Authors:

* Karl DeBisschop <karl.debisschop@fen.com>
