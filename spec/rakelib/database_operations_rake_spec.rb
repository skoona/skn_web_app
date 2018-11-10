
describe "rake db:seed", type: :task do

  it "preloads the local :environment" do
    puts "PREQ: #{task.prerequisites.inspect}"
    expect(task.prerequisites).not_to include "environment"
  end

  # it "runs db:seed rake" do
  #
  #   r = task.execute
  #
  #   expect(r).to be_an Array
  # end
end


describe "rake db:skn_setup", type: :task do

  it "preloads the local :environment" do
    expect(task.prerequisites).not_to include "environment"
  end

  # it "runs db:skn_setup rake" do
  #
  #   expect{ task.invoke(BmiTypes::Lob::WORK_COMP) }.to(
  #       output( match(/Writing WORK_COMP CSV.../) ).to_stdout )
  # end
end

