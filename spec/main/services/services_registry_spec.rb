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
    SknApp.registry
        .register(:catalog_provider, ->(command) { Services::Providers::Catalog.call(command) }, call: false)
        .register(:content_provider, ->(command) { Services::Providers::Content.call(command) }, call: false)
  end
  before :each do
    SknApp.registry
        .register(:catalog_provider, double(:response, call: SknSuccess.call( catalog_json() )), call: false)
        .register(:content_provider, double(:response, call: SknSuccess.call( content_response() )), call: false)
  end

  it '#resources returns expected object. ' do
    expect(described_class.new(package).resources).to be_a SknSuccess
  end

  it '#content returns expected object. ' do
    expect( described_class.new(package).content ).to be_a SknSuccess
  end
end