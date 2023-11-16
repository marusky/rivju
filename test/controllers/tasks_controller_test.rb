require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_task_url
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post tasks_url, params: { task: { assignment_id: @task.assignment_id, classroom_id: @task.classroom_id, description: @task.description, first_submission_deadline: @task.first_submission_deadline, name: @task.name, review_deadline: @task.review_deadline, second_submission_deadline: @task.second_submission_deadline } }
    end

    assert_redirected_to task_url(Task.last)
  end

  test "should show task" do
    get task_url(@task)
    assert_response :success
  end

  test "should get edit" do
    get edit_task_url(@task)
    assert_response :success
  end

  test "should update task" do
    patch task_url(@task), params: { task: { assignment_id: @task.assignment_id, classroom_id: @task.classroom_id, description: @task.description, first_submission_deadline: @task.first_submission_deadline, name: @task.name, review_deadline: @task.review_deadline, second_submission_deadline: @task.second_submission_deadline } }
    assert_redirected_to task_url(@task)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete task_url(@task)
    end

    assert_redirected_to tasks_url
  end
end
