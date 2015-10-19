require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @tag = tags(:programming)
    @priority = priorities(:high)
    # This code is not idiomatically correct.
    @task = Task.new(content: "Lorem ipsum", user_id: @user.id, tag_id: @tag.id, priority_id: @priority.id)
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
  
  test "tag id should be present" do
    @task.tag_id = nil
    assert_not @task.valid?
  end
  
  test "priority id should be present" do
    @task.priority_id = nil
    assert_not @task.valid?
  end
end
