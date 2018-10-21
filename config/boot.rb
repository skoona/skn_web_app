# ##
# File: ./config/boot.rb
# - Initialize Core Application: SknApp
#

# Instantiate Application
begin
  unless defined?(SknApp)
    require_relative 'environment'        # Minimal
  end

  flist =  Dir['./tmp/content/*'] # remove prior downloads
  unless flist.empty?
    fcount = File.delete(*flist)
    puts "TMP Folder Cleaner: Unlinked # #{fcount} files."
  end

  # Load Main Business App
  require_relative '../main/main'

rescue Bundler::BundlerError, StandardError => ex
  $stderr.puts ex.message
  if ex.is_a?(Bundler::BundlerError)
    $stderr.puts "Run `bundle install` to install missing gems"
    exit ex.status_code
  else
    $stderr.puts ex.backtrace[0..8]
    exit 1
  end
end

