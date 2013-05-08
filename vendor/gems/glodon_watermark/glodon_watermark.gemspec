# -*- encoding: utf-8 -*-
require File.expand_path('../lib/glodon_watermark/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["zhangzhe"]
  gem.email         = ["zhangz-c@grandsoft.com.cn"]
  gem.description   = %q{watermark price}
  gem.summary       = %q{watermark price}
  gem.homepage      = "http://watermark.bitaec.com"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "glodon_watermark"
  gem.require_paths = ["lib"]
  gem.version       = GlodonWatermark::VERSION
end
