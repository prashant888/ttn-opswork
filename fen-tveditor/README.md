fen-tveditor Cookbook
=====================
Set up TVeditor Web Sites (*.familyeducation.com and *.teachervision.com)

Requirements
------------
This should be run as a setup recipe in OpsWorks, after:

 * fen-web-server
 * percona::client
 * fen-ssl::teachevision (for teachevision only)

After setup, run fen-aws::teachervision or fen-aws::familyeducation to
set the cost center as a configuration step.

Then, in the Deploy phase, run fen-site-deploy::production-teachervision
to copy the data from staging (nfs1.fen.com) and fen-site-config::teachervision
to set up the correct PHP prepend file(s).

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### fen-tveditor::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fen-tveditor']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### fen-tveditor::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `fen-tveditor` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-tveditor]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
