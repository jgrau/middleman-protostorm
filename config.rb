
# Compass
# --------------------------

  # Susy grids in Compass
  require 'susy'

  # LiveReload 
  activate :livereload

  # Change Compass configuration
  # compass_config do |config|
  #   config.output_style = :compact
  # end



# Haml
# --------------------------

  # CodeRay syntax highlighting in Haml
  # First: gem install haml-coderay
  # require 'haml-coderay'

  # CoffeeScript filters in Haml
  # First: gem install coffee-filter
  # require 'coffee-filter'

  # Automatic image dimensions on image_tag helper
  # activate :automatic_image_sizes



# Page Layouts
# --------------------------

  # Per-page layout changes:
  #
  # With no layout
  # page "/path/to/file.html", :layout => false
  #
  # With alternative layout
  # page "/path/to/file.html", :layout => :otherlayout
  #
  # A path which all have the same layout
  # with_layout :admin do
  #   page "/admin/*"
  # end

  # Proxy (fake) files
  # page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
  #   @which_fake_page = "Rendering a fake page with a variable"
  # end



# Helpers
# --------------------------

  ### Methods defined in the helpers block are available in templates
  helpers do
    ### Calculate the years for a copyright
    def copyright_years(start_year)
      end_year = Date.today.year
      if start_year == end_year
        start_year.to_s
      else
        start_year.to_s + '-' + end_year.to_s
      end
    end


    ### Placekitten placeholder helper
    def placeimage(opts = {})
      return "Missing Image Dimension(s)" unless opts[:width] && opts[:height]
      return "Invalid Image Dimension(s)" unless opts[:width].to_s =~ /^\d+$/ && opts[:height].to_s =~ /^\d+$/

      services = ["http://placecage.com", "http://nicenicejpg.com", "http://baconmockup.com", "http://placedog.com", "http://placesheen.com", "http://lorempixel.com", "http://fillmurray.com", "http://placekitten.com"]

      img  = "<img src=\""

      ### Services - make it into a nice loop someday...
      img << "http://placecage.com"   if opts[:place] == "cage"
      img << "http://nicenicejpg.com" if opts[:place] == "vanilla"
      img << "http://baconmockup.com" if opts[:place] == "bacon"
      img << "http://placedog.com"    if opts[:place] == "dog"
      img << "http://placesheen.com"  if opts[:place] == "sheen"
      img << "http://lorempixel.com"  if opts[:place] == "loremimage"
      img << "http://fillmurray.com"  if opts[:place] == "murray"
      img << "http://placekitten.com" if opts[:place] == "kitten"

      img << services.sample          if opts[:place] == nil # Pick random, if nothing is defined
      img << "/g"                     if opts[:color] == false # If color is false, make it grey (For those who supports it)
      img << "/c"                     if opts[:place] == "cage" && opts[:cage] == "crazy" # Crazy cage!
      img << "/#{opts[:width]}/#{opts[:height]}" # Width/Height
      img << "/#{opts[:tags]}/"       if opts[:tags] # Lorem Image Tags - E.g. sports
      img << "\" />" # Close image tag
      
      img
    end

  end



# Middleman Settings
# --------------------------

  ### Change the CSS directory
  set :css_dir, "assets/stylesheets"

  ### Change the JS directory
  set :js_dir, "assets/javascripts"

  ### Change the images directory
  set :images_dir, "assets/images"

  ### Set partials directory
  set :partials_dir, 'partials'



# Build Config
# --------------------------
  configure :build do
    # Make favicons
    # use: https://github.com/follmann/middleman-favicon-maker
    # activate :favicon_maker

    # Minify
    # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/file-size-optimization.html.markdown#compressing-images
    activate :minify_css
    activate :minify_javascript

    # Enable cache buster
    # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/improving-cacheability.html.markdown#cache-buster-in-query-string
    activate :cache_buster

    # Use relative URLs
    activate :relative_assets

    # Compress PNGs after build
    # use: https://github.com/middleman/middleman-smusher
    activate :smusher

    # Gzip HTML, CSS, and JavaScript
    # see: https://github.com/middleman/middleman-guides/blob/master/source/advanced/file-size-optimization.html.markdown#gzip-text-files
    activate :gzip
  end


