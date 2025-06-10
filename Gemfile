# frozen_string_literal: true

source "https://rubygems.org"

# Jekyll version
gem "jekyll", "~> 4.3.2"

# Jekyll plugins
group :jekyll_plugins do
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-feed", "~> 0.17"
  gem "jekyll-seo-tag", "~> 2.8"
  gem "jekyll-paginate", "~> 1.1"
  gem "jekyll-compress-images", "~> 1.2"
  gem "jekyll-minifier", "~> 0.1"
end

# GitHub Pages compatibility (optional - use if deploying to GitHub Pages)
# Uncomment the next line if you want GitHub Pages compatibility
# gem "github-pages", "~> 228", group: :jekyll_plugins

# Performance and optimization
gem "kramdown-parser-gfm", "~> 1.1"

# Development dependencies
group :development do
  gem "webrick", "~> 1.8"  # Required for Ruby 3.0+
  gem "listen", "~> 3.8"   # Auto-regeneration
  gem "jekyll-admin", "~> 0.11"  # Optional: Web-based admin interface
end

# Windows and JRuby specific gems
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]

# Lock `http_parser.rb` gem to `v0.6.x` on JRuby builds 
# since newer versions of the gem do not have a Java counterpart.
gem "http_parser.rb", "~> 0.6.0", :platforms => [:jruby]

gem "csv", "~> 3.3"
