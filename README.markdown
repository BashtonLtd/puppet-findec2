#findec2

A small Puppet module to use the https://github.com/BashtonLtd/find-ec2/
utility.

We use this to generate Varnish config and PHP snippets where one might
otherwise use PuppetDB and stored configuration.

## Usage

To generate a Varnish VCL snippet with backends of all machines which
have a tag 'machinetype' and value 'web':


```puppet

  findec2::generate { 'web':
    template  => '/etc/find-ec2/templates/varnish.template',
    service   => 'varnish',
    output    => '/etc/varnish/web.vcl',
    frequency => '1',
    tagname   => 'machinetype',
    tagvalue  => 'web',
    dummy     => true,
  }
```


## Contributing

Pull requests gratefully accepted.  Basic tests have been provided; run
`rake test`.
