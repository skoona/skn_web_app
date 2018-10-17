# ##
# File: ./main/skn_web.rb
#
# - Main Web Interface Entry

class SknWeb < Roda

  opts[:root] = SknApp.root
  opts[:env]  = SknApp.env

  use Rack::CommonLogger
  use Rack::Reloader

  use Rack::Cookies
  use Rack::Session::Cookie, {
      secret: SknSettings.skn_base.secret,
      key: SknSettings.skn_base.session_key,
      domain: SknSettings.skn_base.session_domain
  }

  # Enables Capybara's Session Access
  use RackSessionAccess::Middleware if opts[:env].test?

  use Warden::Manager do |config|
    config.default_scope = :access_profile
    config.default_strategies [:api_auth, :remember_token, :password]
    config.scope_defaults :access_profile, {
        store: true,
        strategies: [:password, :remember_token, :api_auth],
        action: 'sessions/unauthenticated' }
    config.failure_app       = self
    config[:public_pages]    = SknSettings.security.public_pages
    config[:production]      = opts[:env].production?
    config[:asset_paths_ary] = SknSettings.security.asset_paths
    config[:sys_logger]      = Logging.logger['WAR']
    config[:session_expires] = SknSettings.security.session_expires.to_i
    config[:remember_for]    = SknSettings.security.remembered_for.to_i
  end

  use Rack::MethodOverride

  use Rack::Protection unless opts[:env].test?

  use Rack::ShowExceptions
  use Rack::NestedParams

  plugin :all_verbs
  unless opts[:env].test?
    # TODO: Revisit these configuration options: https://github.com/baldowl/rack_csrf#options
    plugin :csrf, { raise: true,
                    check_only: ['POST /sessions/signin'],
                    skip_if: lambda { |request|
                      ['HTTP_AUTHORIZATION', 'X-HTTP_AUTHORIZATION',
                       'X_HTTP_AUTHORIZATION', 'REDIRECT_X_HTTP_AUTHORIZATION'].any? {|k|
                        request.env.key?(k) }
                    }
    }
  end

  # ERB support in SCSS, already present for JS
  Tilt.pipeline('scss.erb')

  plugin :render, {
      engine: 'html.erb',
      escape: false,
      views: "#{opts[:root]}/web/views",
      allowed_paths: ['/', '/layouts', '/profiles', '/sessions'],
      layout: '/application',
      layout_opts: {views: "#{opts[:root]}/web/views/layouts"}
  }

  plugin :not_found do # Path Not Found Handle
    view :http_404, path: File.expand_path('web/views/http_404.html.erb', opts[:root])
  end

  plugin :error_handler do |uncaught_exception|  # Uncaught Exception Handler
    view :unknown, locals: {exception: uncaught_exception }, path: File.expand_path('web/views/unknown.html.erb', opts[:root])
  end

  plugin :assets, {
      css_dir: 'stylesheets',
      js_dir: 'javascript',
      css: ['skn.scss.erb' ],
      js: ['jquery-3.2.1.js', 'bootstrap-3.3.7.js', 'jquery.matchHeight.js', 'bootstrap-select.js',
           'jquery.dataTables.js', 'dataTables.bootstrap.js', 'skn.custom.js.erb'],
      dependencies: {'_bootstrap.scss' => Dir['assets/stylesheets/**/*.scss', 'assets/stylesheets/*.scss'] }
  }
  compile_assets if opts[:env].production?


  plugin :view_options
  plugin :symbol_views
  plugin :symbol_status
  plugin :content_for
  plugin :forme
  plugin :tag_helpers        # includes :tag plugin, for HTML generation: https://github.com/kematzy/roda-tags/
  plugin :json
  plugin :i18n, :locale => ['en']
  plugin :flash
  plugin :public             #replaces plugin :static, %w[/images /fonts]
  plugin :head
  plugin :halt
  plugin :drop_body

  plugin :multi_route

  # ##
  # Routing Table
  # ##
  route do |r|

    r.assets unless opts[:env].production?

    r.public

    warden_messages

    r.multi_route

    r.root do
      if opts[:env].production?
        flash_message(:success, ['Welcome to SknWebApp! A client UI for SknServices'], true)
      else
        flash_message(:success, ['Welcome to SknWebApp!', 'Client UI for SknServices'], true)
        flash_message(:info, ['All messages time out!', 'Except for :danger or Error messages!'], true)
        flash_message(:danger, "Single messages are also supported!", true)
      end
      view(:homepage)
    end

    r.get "about" do
      view(:about)
    end

    r.get "contact" do
      view(:contact)
    end

  end # End Routing Tree

end # end class


