require "emberjs_website_styles/version"
require "fileutils"
require "thor"
require "pathname"

# Based on Bourbon's generator

module EmberjsWebsiteStyles
  class Generator < Thor
    map ["-v", "--version"] => :version

    desc "install", "Install EmberjsWebsiteStyles into your project"
    method_options :path => :string, :force => :boolean
    def install
      if style_files_already_exist? && !options[:force]
        puts "EmberjsWebsiteStyles files already installed, doing nothing."
      else
        install_files
        puts "EmberjsWebsiteStyles files installed to #{install_path}/"
      end
    end

    desc "version", "Show EmberjsWebsiteStyles version"
    def version
      say "EmberjsWebsiteStyles #{EmberjsWebsiteStyles::VERSION}"
    end

    private

    def style_files_already_exist?
      install_path.exist?
    end

    def install_path
      @install_path ||= if options[:path]
          Pathname.new(File.join(options[:path], "emberjs_website_styles"))
        else
          Pathname.new("emberjs_website_styles")
        end
    end

    def install_files
      make_install_directory
      copy_in_scss_files
    end

    def make_install_directory
      FileUtils.mkdir_p(install_path)
    end

    def copy_in_scss_files
      FileUtils.cp_r(all_stylesheets, install_path)
    end

    def all_stylesheets
      Dir["#{stylesheets_directory}/*"]
    end

    def stylesheets_directory
      File.join(top_level_directory, "core")
    end

    def top_level_directory
      File.dirname(File.dirname(File.dirname(__FILE__)))
    end
  end
end
