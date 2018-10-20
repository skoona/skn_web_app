# ##
# catalog_spec.rb

describe Services::Providers::Catalog, 'Resource Catalog Providers' do
  let(:cmd) { Services::Commands::RetrieveAvailableResources.new(username: "eptester") }

  it 'Returns Success object. ' do
    skn = double(:response, call: SknSuccess.call( rd_catalog_json() ))
    expect(described_class.call(cmd, {get_request_handler: skn }).success).to be true
  end

  it 'Returns Failure object. ' do
    skn = double(:response, call: SknFailure.call( rd_catalog_failed_json() ))
    expect(described_class.call(cmd, {get_request_handler: skn }).success).to be false
  end

  it 'Returns Failure object caused by unknown/invalid command. ' do
    cmd.instance_variable_set(:@username, nil)
    expect(described_class.call(cmd).success).to be false
  end
end