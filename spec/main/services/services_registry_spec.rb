# ##
# services_registry_spec.rb

describe Services::ServicesRegistry, 'Service Registry Module. ' do
  let(:package) {
    {
        roda_context: double(:roda,
                             current_user: double(:current_user, username: 'eptester'),
                             request: double(:request, params: {"id" => "1.0.1", 'content_type' => 'Commission'})
        )
    }
  }
  before :each do
    allow(SknApp.registry).to receive(:resolve).with(:catalog_provider).and_return( double(:response, call: SknSuccess.call( rd_catalog_json() )) )
    allow(SknApp.registry).to receive(:resolve).with(:content_provider).and_return( double(:response, call: SknSuccess.call( rd_content_response() )) )
  end

  it '#resources returns expected object. ' do
    expect(described_class.new(package).resources).to be_a SknSuccess
  end

  it '#content returns expected object. ' do
    expect( described_class.new(package).content ).to be_a SknSuccess
  end
end