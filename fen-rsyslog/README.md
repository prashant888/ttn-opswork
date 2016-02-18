fen-graylog-server Cookbook
===========================
A wrapper package to configure rsyslog.

Requirements
------------
#### cookbooks

- `rsyslog` - the rsyslog cookbook is used to manage the configuration.

Attributes
----------

#### fen-graylog-server::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fen-graylog-server']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### fen-rsyslog::collector

Include `fen-rsyslog::collector` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-rsyslog::collector]"
  ]
}
```

License and Authors
-------------------
Authors:

- Karl DeBisschop <karl.debisschop@fen.com>
