require 'test_helper'

class TaskTagTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    # This code is not idiomatically correct.
    @tasktag = TaskTag.new(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
end
