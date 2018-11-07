
describe "rake db:seed", type: :task do

  it "preloads the local :environment" do
    puts "PREQ: #{task.prerequisites.inspect}"
    expect(task.prerequisites).not_to include "environment"
  end

  # it "runs workers comp path" do
  #   allow(Quoting::Request).to receive_message_chain(:new, :work_comp_template).and_return(restore_test_data('brms_template_data'))
  #   allow(WorkCompQuestionMap).to receive(:create).and_return(true)
  #
  #   r = task.execute
  #
  #   expect(r).to be_an Array
  #   expect(r).to_not be_empty
  # end
end


describe "rake db:skn_setup", type: :task do

  it "preloads the local :environment" do
    expect(task.prerequisites).not_to include "environment"
  end

  # it "runs work_comp path" do
  #   allow(Quoting::GatherWorkCompQuestions).to receive_message_chain(:call).and_return(restore_test_data('rules_gathered_questions'))
  #   allow(Quoting::GatherCmpQuestions).to receive_message_chain(:call).and_return(restore_test_data('rules_gathered_questions'))
  #
  #   expect{ task.invoke(BmiTypes::Lob::WORK_COMP) }.to(
  #       output( match(/Writing WORK_COMP CSV.../) ).to_stdout )
  # end
end

