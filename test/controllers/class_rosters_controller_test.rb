require 'test_helper'

class ClassRostersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_roster = class_rosters(:one)
  end

  test "should get index" do
    get class_rosters_url
    assert_response :success
  end

  test "should get new" do
    get new_class_roster_url
    assert_response :success
  end

  test "should create class_roster" do
    assert_difference('ClassRoster.count') do
      post class_rosters_url, params: { class_roster: { count: @class_roster.count, description: @class_roster.description, subtitle: @class_roster.subtitle, title: @class_roster.title } }
    end

    assert_redirected_to class_roster_url(ClassRoster.last)
  end

  test "should show class_roster" do
    get class_roster_url(@class_roster)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_roster_url(@class_roster)
    assert_response :success
  end

  test "should update class_roster" do
    patch class_roster_url(@class_roster), params: { class_roster: { count: @class_roster.count, description: @class_roster.description, subtitle: @class_roster.subtitle, title: @class_roster.title } }
    assert_redirected_to class_roster_url(@class_roster)
  end

  test "should destroy class_roster" do
    assert_difference('ClassRoster.count', -1) do
      delete class_roster_url(@class_roster)
    end

    assert_redirected_to class_rosters_url
  end
end
