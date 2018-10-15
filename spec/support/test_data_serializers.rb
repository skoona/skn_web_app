# spec/support/test_data_serializers.rb
#

module TestDataSerializers

  # Serializes object to yaml file
  def write_test_data object, file_name
    fname = "./spec/factories/#{file_name}.yml"
    fname = "./spec/factories/last_test_data.yml" if fname.blank?
    raise ArgumentError, "File exists '#{fname}' -- delete the current one, or use a different name" if File.exist?(fname)
    raise ArgumentError, "Method requires an object as first params. " if object.blank?
    File.open(fname, "w") do |file|
      YAML::dump(object, file)
    end
  end

  # Restores object from yaml file
  def restore_test_data file_name
    fname = "./spec/factories/#{file_name}.yml"
    fname = "./spec/factories/last_test_data.yml" if fname.blank?
    YAML::load( IO.read(fname) )
  end

end
