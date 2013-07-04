name             'freenx-server'
maintainer       'Matthew Ueckerman'
maintainer_email 'matthew.ueckerman@myob.com'
license          'All rights reserved'
description      'Installs/Configures freenx-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.0.1'

recipe 'freenx-server', 'Installs/Configures freenx-server'

supports 'ubuntu', '= 12.04'
