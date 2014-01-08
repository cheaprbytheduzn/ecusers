ecusers Cookbook
=================
Create and Configure Enterprise Chef users.

An optional cookbook for pre-defining the service accounts utilized by Enterprise Chef.

[![Build Status](https://secure.travis-ci.org/cheaprbytheduzn/ecusers.png?branch=master)](http://travis-ci.org/cheaprbytheduzn/ecusers)

Requirements
------------
An OS that supports Enterprise Chef

Attributes
----------
See attributes/default.rb for details

Highlights:
`['ecusers']['manage-opscode-user']` - Whether to manage the user 'opscode'.  (Default: `true`)
`['ecusers']['manage-home-dir']` - Whether to delete the users home directory when the `cleanup` recipe is applied.  (Default:  `true`)


#### ecusers::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['ecusers']['manage-opscode-user']</tt></td>
    <td>Boolean</td>
    <td>whether to manage the user 'opscode' </td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### ecusers::default

Include `ecusers` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[ecusers]"
  ]
}
```
Apply the `cleanup` recipe to remove the users.  E.g. on your node override the run_list temporarily:

```bash
chef-client --once -o "recipe[ecusers::cleanup]" ...
```

License and Authors
-------------------
Author: ken.miles@hp.com

```text
Copyright 2014 Hewlett-Packard, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

