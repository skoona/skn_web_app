# ##
# File: ./web/views/helpers/html_helpers.rb
#

class SknWeb

  def registry_service
    Services::ServicesRegistry.new(roda_context: self)
  end

  def menu_active?(item_path)
    request.path.eql?(item_path) ? 'active' : ''
  end

  def generate_standard_json_error_message(identifier, status, additional_detail=nil)
    {
        status: Rack::Utils.status_code(status),
        code: identifier,
        additional_detail: additional_detail,
        title: t[:en][:errors][identifier][:title],
        detail: t[:en][:errors][identifier][:detail]
    }
  end

  def wrap_send_file_response(service_response, response_status, error_status=:not_found)
    # Generate content for Response
    if service_response.success
      response['Content-Type'] = service_response.content_type
      response['content-disposition'] = service_response.content_disposition
      request.halt response.finish_with_body(IO.binread(service_response.payload))
    else
      http_response = generate_standard_json_error_message( response_status, error_status, "Request: #{env['REQUEST_URI']}, Message: #{service_response.message}")
      response.status = http_response[:status]
      http_response
    end
  end

  def wrap_html_response(service_response, show_path, redirect_path='/')
    flash_message(:warning, service_response.message, true) unless service_response.message.nil? || service_response.success
    # request.redirect(redirect_path) unless service_response.success
    view(show_path, locals: {resources: service_response})
  end

  def wrap_html_and_redirect_response(service_response, redirect_path='/')
    flash_message(:warning, service_response.message, true) unless service_response.message.nil?
    redirect(redirect_path)
  end

  def wrap_json_response(service_response)
    response.status = (service_response.package.success ? :accepted : :not_acceptable)
    if service_response.success
      service_response.to_hash
    else
      generate_standard_json_error_message( response.status,
                                            :not_acceptable,
                                            "Request: #{env['REQUEST_URI']}, Message: #{service_response.message}")
    end
  end

  def flash_message(rtype, text, now=false)
    type = [:success, :info, :warning, :danger].include?(rtype.to_sym) ? rtype.to_sym : :info
    if text.is_a?(Array)
      text.flatten.each do |val|
        now ? flash_message_now(type, val) : flash_message_next(type, val)
      end
    else
      now ? flash_message_now(type, text) : flash_message_next(type, text)
    end
  end

  def attempted_page_name
    attempted_page&.empty? ? '' : attempted_page.split('/').last
  end
  def attempted_page
    session['skn.attempted.page'] || env.dig('warden.options',:attempted_path) || ""
  end

  def current_environment_test?
    SknApp.env.test?
  end
  def current_environment_production?
    SknApp.env.production?
  end
  def current_environment_name
    SknApp.env
  end

  def current_route_name # currently one-level-routes
    current_page_name
  end
  def current_action_name
    elements = current_page.split('/')
    elements[2] || elements[1]
  end

  def current_page_debug_filter
    ['resources', 'signin'].any? {|x| x.eql?(current_page_name)} || SknApp.env.production?
  end

  def current_page_name_include?(page_action)
    current_page_name&.include?(page_action)
  end

  def current_page_name
    current_page&.empty? ? '' : current_page.split('/').last
  end
  def current_page
    request.path
  end

  def release_name_and_version
    release_name + release_version
  end
  def release_name
    SknSettings.Packaging.pgmName
  end
  def release_version
    " Version #{SknSettings.Packaging.releaseVersion}"
  end

  def choose_content_icons(content)
    if content.content_type.include?('LicensedStates')
      '<i class="fa fa-balance-scale fa-2x"></i>'
    elsif content.content_type.include?('Notification')
      '<i class="fa fa-envelope-open-o fa-2x"></i>'
    elsif content.filename.include?('pdf')
      '<i class="fa fa-file-pdf-o fa-2x"></i>'
    elsif content.filename.include?('jpg') or content.filename.include?('png')
      '<i class="fa fa-file-image-o fa-2x"></i>'
    elsif content.filename.include?('log')
      '<i class="fa fa-file-text-o fa-2x"></i>'
    else
      '<i class="fa fa-file-o fa-2x"></i>'
    end
  end

  # Rails should have a 'number_to_human_size()' in some version ???
  def human_filesize(value)
    {
        'B'  => 1024,
        'KB' => 1024 * 1024,
        'MB' => 1024 * 1024 * 1024,
        'GB' => 1024 * 1024 * 1024 * 1024,
        'TB' => 1024 * 1024 * 1024 * 1024 * 1024
    }.each_pair { |e, s| return "#{(value.to_f / (s / 1024)).round(1)} #{e}" if value < s }
  end

  private

  def flash_message_next(type, text)
    if flash[type] and flash[type].is_a?(Array)
      flash[type].push( text )
    elsif flash[type] and flash[type].is_a?(String)
      flash[type] = [flash[type], text]
    else
      flash[type] = [text]
    end
  end

  def flash_message_now(type, text)
    if flash.now[type] and flash.now[type].is_a?(Array)
      flash.now[type].push( text )
    elsif flash.now[type] and flash.now[type].is_a?(String)
      flash.now[type] = [flash.now[type], text]
    else
      flash.now[type] = [text]
    end
  end


end
