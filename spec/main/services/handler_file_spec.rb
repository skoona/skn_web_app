# ##
# handler_file_spec.rb

describe Services::Handlers::File, 'File Response Handler' do


  it 'Returns Success object. ' do
    expect(described_class.call(file_download_response).success).to be true
  end

  it 'Returns Failure object. ' do
    rsp = file_download_response
    rsp.headers['content-disposition'] = 'inline'
    expect{ described_class.call(rsp) }.to raise_error(NoMethodError)
  end
end