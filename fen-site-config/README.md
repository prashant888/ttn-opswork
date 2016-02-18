fen-site-config Cookbook
========================
The cookbook sets up PHP configuration for web sites. It produces a prepend.php variant for the site that
will be run onder this instance. (The prepend files are typically suffixed with a site indicator like
prepend-tv.php to support multiple VirtualHosts, e.g., on personal development machines)

Requirements
------------
Although not required for operation, this cookbook doe not really make sense without PHP installed.

The apache cookbook is included because recipes refer to node['apache']['user'] and node['apache']['group']

#### packages
No packages are required beynd those installed by the apache and php cookbooks.

Attributes
----------

#### fen-site-config::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fen']['sitevars]['legacy']</tt></td>
    <td>Array</td>
    <td>Old-style PHP globals</td>
    <td><tt>--</tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_html_dir']</tt></td>
    <td>String</td>
    <td>DocumentRoot</td>
    <td><tt>/site/html</tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_lib_dir']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt>/site/lib</tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_html_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_image_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_script_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_search_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_query_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_dbro_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_id_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_tv_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_maps_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_tv_html_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_fb_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_fb_track_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_data_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>...['ip_db_pop_host']</tt></td>
    <td>String</td>
    <td></td>
    <td><tt></tt></td>
  </tr>
  <tr>
    <td><tt>['fen']['sitevars]['global']</tt></td>
    <td>Array</td>
    <td>PHP globals for LocalVars class</td>
    <td><tt>--</tt></td>
  </tr>
  <tr>
    <td><tt>...['IMAP_SERVER']</tt></td>
    <td>[String]</td>
    <td>Where to look for mail (testing)</td>
    <td><tt>['alert.fen.com']</tt></td>
  </tr>
</table>

Usage
-----
#### fen-site-config::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `fen-site-config` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fen-site-config]"
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
