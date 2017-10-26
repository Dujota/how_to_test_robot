require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def setup
    @robot = Robot.new
  end

  def teardown
    @robot = nil
  end

  def test_that_foreign_robot_needing_repairs_sent_to_station_1
    # arrange
    @robot.foreign_model = true
    @robot.needs_repairs = true
    # act
    test_result = @robot.station
    # assert
    expected_value = 1

    assert_equal(expected_value, test_result)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # skip
    # arrange
    @robot.vintage_model = true
    @robot.needs_repairs = true
    # act
    test_result = @robot.station
    # assert
    assert_equal(2, test_result)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # skip
    # arrange
    @robot.needs_repairs = true
    # act
    test_result = @robot.station
    # assert
    assert_equal(3, test_result)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # skip
    # arrange
    @robot.needs_repairs = false
    # act
    test_result = @robot.station
    # assert
    assert_equal(4, test_result)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # skip
    # arrange
    @robot.todos
    # act
    test_result = @robot.prioritize_tasks
    # assert
    assert_equal(-1, test_result)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # skip
    # arrange
    @robot.todos = [1,2,3,4,5]
    # act
    test_result = @robot.prioritize_tasks
    # assert
    assert_equal(5, test_result)
  end

  def test_workday_on_day_off_returns_false
    # skip
    # arrange
    @robot.day_off = 'Saturday'
    # act
    test_result = @robot.workday?('Saturday')
    # assert
    assert_equal(false, test_result)
  end

  def test_workday_not_day_off_returns_true
    # skip
    # arrange
    @robot.day_off = 'Saturday'
    # act
    test_result = @robot.workday?('Monday')
    # assert
    assert_equal(true, test_result)
  end

end
