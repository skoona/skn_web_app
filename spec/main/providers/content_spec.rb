# ##
# content_spec.rb

describe Services::Providers::Content, 'Resource Content Providers' do
  let(:cmd) { Services::Commands::RetrieveResourceContent.new({
                     id: '1:0:0',
                     username: 'eptester',
                     content_type: 'Commission' })
  }

  it 'Returns Success object. ' do
    skn = double(:response, call: SknSuccess.call( rd_content_response() ))
    expect(described_class.call(cmd, {"get_request_handler" => skn }).success).to be true
  end

  it 'Returns Failure object. ' do
    skn = double(:response, call: SknFailure.call( rd_content_response() ))
    expect(described_class.call(cmd, {"get_request_handler" => skn }).success).to be false
  end

  it 'Returns Failure object caused by unknown/invalid command. ' do
    cmd.instance_variable_set(:@username, nil)
    expect(described_class.call(cmd).success).to be false
  end
end