# ##
# handler_file_spec.rb

describe Services::Handlers::GetRequest, 'Get Request Handler' do
  let(:uri) { "http://vserv.skoona.net:8080/profiles/api_in_action?username=eptester" }

  it 'Returns Success object. ' do
    stub_request(:get, "http://vserv.skoona.net:8080/profiles/api_in_action?username=eptester").
        with(
            headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'Authorization'=>'Basic ZGV2ZWxvcGVyOmRldmVsb3Blcjk5',
                'User-Agent'=>'Ruby'
            }).
        to_return(status: 200, body: "", headers: {})
    expect(described_class.call( URI.parse(uri) ).success).to be true
  end

  it 'Returns Failure object. ' do
    stub_request(:get, "http://vserv.skoona.net:8080/profiles/api_in_action?username=eptester").
        with(
            headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'Authorization'=>'Basic ZGV2ZWxvcGVyOmRldmVsb3Blcjk5',
                'User-Agent'=>'Ruby'
            }).
        to_return(status: 404, body: "", headers: {})
    expect(described_class.call( URI.parse(uri) ).success).to be false
  end
end