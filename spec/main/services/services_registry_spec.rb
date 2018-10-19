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
  after :all do
    SknApp.registry.unstub(:catalog_provider).unstub(:content_provider)
  end
  before :all do
    SknApp.registry.enable_stubs!
      .stub(:catalog_provider, double(:response, call: SknSuccess.call( catalog_json() )) )
      .stub(:content_provider, double(:response, call: SknSuccess.call( content_response() )) )
  end

  it '#resources returns expected object. ' do
    expect(described_class.new(package).resources).to be_a SknSuccess
  end

  it '#content returns expected object. ' do
    expect( described_class.new(package).content ).to be_a SknSuccess
  end
end