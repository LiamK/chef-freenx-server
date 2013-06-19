# freenx-server cookbook

Installs and Configures No Machine's [NX Server Free Edition](http://www.nomachine.com/products.php).

Tested on Ubuntu 12.04 x86_64.

# Requirements

# Usage

Install default recipe

# Attributes

```ruby
default["freenx-server"]["setup_archive_url"] = "https://bugs.launchpad.net/freenx-server/+bug/576359/+attachment/1378450/+files/nxsetup.tar.gz"
```

# Recipes

* __default__: Installs freenx-server package.  Configures FreeNX server.  Enables SSH password authentication.

# Author

Author:: Matthew Ueckerman

Organisation:: MYOB
