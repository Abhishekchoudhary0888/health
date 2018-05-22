# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
  prefix.cascade = false
  prefix.inline = true
  # prefix.ignore   = ['hacks.css']
end

config[:hostname] = 'https://youreverydayhealth.com'
config[:website_title] = 'Your Every Day Health'

set :url_root, 'https://youreverydayhealth.com' # For sitemap plugin

activate :sprockets
sprockets.append_path File.join(root, 'bower_components')

config[:images_dir] = 'images'
config[:css_dir] = 'css'
config[:js_dir] = 'js'



# Layouts
# https://middlemanapp.com/basics/layouts/
# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/


helpers do

  def inline_stylesheet(name)
    content_tag :style do
      sprockets["#{name}.css"].to_s
    end
  end

  def inline_javascript(name)
    content_tag :script do
      sprockets["#{name}.js"].to_s
    end
  end
end

activate :ogp do |ogp|
  ogp.namespaces = {
      og: data.ogp.og
  }
  ogp.namespaces[:og][:title] = config[:website_title]
  ogp.base_url = config[:hostname]
  ogp.auto = %w{url}
end


# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css, :inline => true
  activate :minify_javascript, inline: true, compressor: proc {
    ::Uglifier.new()
  }
  activate :minify_html do |html|
    html.remove_form_attributes = false
    html.remove_input_attributes = false
  end

  # Enable cache buster
  activate :asset_hash
end


# Reload the browser automatically whenever files change
configure :development do
 activate :livereload
#  config[:file_watcher_ignore] += [/.idea\//]
end
