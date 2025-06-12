# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name             = 'htmldiff'
  s.version          = '0.0.1.1'
  s.homepage         = 'http://github.com/openupresources/htmldiff'
  s.summary          = 'HTML diffs of text, forked from http://github.com/myobie/htmldiff'
  s.license          = 'MIT'

  s.authors          = ['Nathan Herald']
  s.email            = 'nathan@myobie.com'
  s.date             = '2008-11-21'

  s.rdoc_options     = ['--main', 'README.md']
  s.extra_rdoc_files = ['README.md', 'LICENSE']

  s.require_paths    = ['lib']

  # Manifest
  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")

  # Dependencies
  s.add_runtime_dependency('nokogiri', '>= 1.6.5')
end
