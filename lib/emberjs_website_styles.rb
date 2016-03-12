require "emberjs_website_styles/generator"

emberjs_website_styles_path = File.expand_path("../../core", __FILE__)
ENV["SASS_PATH"] = File.join([ENV["SASS_PATH"], emberjs_website_styles_path].compact)
