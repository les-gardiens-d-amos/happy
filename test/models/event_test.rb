require "test_helper"

class EventTest < ActiveSupport::TestCase
  setup do
    @data = {
      title: "one title for test",
      date: "01/01/2021"
    }

    @event = Event.new(@data).save
  end

  test "not save event without data" do
    event = Event.new
    assert_not event.save, "Dont save event without data"
  end

  test "save event with data" do
    event = Event.new(@data)
    assert event.save, "save event with data"
  end

  test "find all event" do
    events = Event.all
    assert_not_equal([], events, "Return all event")
  end

  test "find event by title" do
    event = Event.find_by(title: "one title for test")
    assert_not_equal(nil, event, "return event with a title")
  end

  test "delete all event" do
    Event.delete_all
    events = Event.all
    assert_equal([], events, "Retuenr empty array after delete all")
  end
end
