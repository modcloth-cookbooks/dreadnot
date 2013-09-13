exports.config = {
  name: 'Example App',
  env: 'derp',
  data_root: './data',
  default_url: 'http://example.com',
  htpasswd_file: './htpasswd',
  stacks: {
    example: {
      tip: 'master',
      regions: ['all'],
      dryrun: true
    }
  }
}
