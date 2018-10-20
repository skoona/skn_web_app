# ##
# 02-init_logging
#

module Skn

  begin
    Logging.init(:debug, :info, :perf, :warn, :error, :fatal)
    dpattern = Logging.layouts.pattern({ pattern: '%d %c:%-5l %m\n',
                                         date_pattern: '%Y-%m-%d %H:%M:%S.%3N' })
    astdout = Logging.appenders.stdout( $stdout, :layout => dpattern)
    arolling = Logging.appenders.rolling_file( 'rolling_log',
                                               :filename => "./log/#{SknApp.env}.log",
                                               :age => 'daily',
                                               :size => 12582912,
                                               :keep => 9,
                                               :layout => dpattern,
                                               :color_scheme => 'default' )
    Logging.logger.root.level = (SknApp.env.production? ? :info : :debug )
    Logging.logger.root.appenders = (SknApp.env.test? ? arolling : [astdout, arolling] )

    # SknApp.logger = Logging.logger['SKN']

    SknApp.configure do |cfg|
      cfg.logger = Logging.logger['SKN']
    end

    SknApp.logger.info "SknApp Logger Setup Complete! loaded: #{SknApp.env}"

  rescue StandardError => e
    $stderr. e
    $stderr. e.message
    $stderr. e.backtrace
    exit 1
  end

end