fen-continuous-integration Cookbook
========================
Sets up a continuous integration environment, including:

* Jenkins master server
* Jenkins slave servers
* Artifact repository

Requirements
------------
TODO: List your cookbook requirements. Be sure to include any requirements this cookbook has on platforms, libraries, other cookbooks, packages, operating systems, etc.

e.g.
#### cookbooks
- `tomcat`

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### fen-continuous-integration::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fen-build-farm']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### fen-continuous-integration::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `fen-continuous-integration` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-continuous-integration]"
  ]
}
```


License and Authors
-------------------
Authors:
- Karl DeBisschop <karl.debisschop@fen.com>
