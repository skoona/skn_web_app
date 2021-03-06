# Code Coverage

  SimpleCov.start do
    merge_timeout 1500
    minimum_coverage 60

    add_filter '/bin/'
    add_filter '/coverage/'
    add_filter '/notes/'
    add_filter '/log/'
    add_filter '/assets/'
    add_filter '/public/'
    add_filter '/spec/'
    add_filter '/vendor/'

    add_group 'Main Application' do |src_file|
      ['main','config', 'rakelib'].any? do |item|
        src_file.filename.include? item
      end
    end

    add_group 'Web Interface' do |src_file|
      ['web'].any? do |item|
        src_file.filename.include? item
      end
    end

    add_group 'Web Routes' do |src_file|
      ['web/routes'].any? do |item|
        src_file.filename.include? item
      end
    end
    add_group 'Authentication' do |src_file|
      ['main/authentication', 'web/security'].any? do |item|
        src_file.filename.include? item
      end
    end
    add_group 'Persistence' do |src_file|
      ['main/persistence'].any? do |item|
        src_file.filename.include? item
      end
    end
    add_group 'Services' do |src_file|
      ['main/services'].any? do |item|
        src_file.filename.include? item
      end
    end
  end
