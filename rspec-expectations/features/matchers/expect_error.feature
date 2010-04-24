Feature: expect error

  Expect a proc to change the state of some object.
  
  Scenario: expect error
    Given a file named "expect_error_spec.rb" with:
      """
      describe Object, "#non_existent_message" do
        it "should raise" do
          expect{Object.non_existent_message}.to raise_error(NameError)
        end
      end

      #deliberate failure
      describe Object, "#public_instance_methods" do
        it "should raise" do
          expect{Object.public_instance_methods}.to raise_error(NameError)
        end
      end
      """
    When I run "rspec expect_error_spec.rb"
    Then I should see "2 examples, 1 failure"
    Then I should see "expected NameError but nothing was raised"

  Scenario: expect no error
    Given a file named "expect_no_error_spec.rb" with:
      """
      describe Object, "#public_instance_methods" do
        it "should not raise" do
          expect{Object.public_instance_methods}.to_not raise_error(NameError)
        end
      end

      #deliberate failure
      describe Object, "#non_existent_message" do
        it "should not raise" do
          expect{Object.non_existent_message}.to_not raise_error(NameError)
        end
      end
      """
    When I run "rspec expect_no_error_spec.rb"
    Then I should see "2 examples, 1 failure"
    Then I should see "undefined method `non_existent_message'"

