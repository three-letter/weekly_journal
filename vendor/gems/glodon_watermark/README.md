# GlodonWatermark

watermark price
watermark string

## Installation
1. puts glodon_watermark into folder vendor gems

2. Add this line to your application's Gemfile:
gem 'glodon_watermark', :path => "vendor/gems/"

3. execute:
$ bundle


## Usage
in view
<%= image_tag price_image_url(price) %>
for example:
<%= image_tag price_image_url("12.12万") %>
<%= image_tag price_image_url(1024) %>

<%= image_tag string_image_url(email) %>
for example:
<%= image_tag string_image_url("zhangz-c@grandsoft.com") %>