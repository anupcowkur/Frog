require 'test_helper'

class ExiterTest < Minitest::Test
  def setup
    $stderr.stubs(:write)
    @exiter = Exiter.new
  end

  def test_exits_with_message_on_no_search_term
    err = assert_raises SystemExit do
      @exiter.exit_due_to_no_search_term
    end

    assert_equal "\e[0;31;49mYou need to provide something to search for\e[0m", err.message
    assert_equal 1, err.status
  end

  def test_exits_with_message_on_no_doc_found
    err = assert_raises SystemExit do
      @exiter.exit_due_to_doc_not_found
    end

    assert_equal "\e[0;31;49mSorry. It looks like we couldn't find what you were looking for\e[0m", err.message
    assert_equal 1, err.status
  end

  def test_exits_with_message_on_incorrect_index
    err = assert_raises SystemExit do
      @exiter.exit_due_to_incorrect_index
    end

    assert_equal "\e[0;31;49mSorry. It looks like you didn't enter the correct index\e[0m", err.message
    assert_equal 1, err.status
  end

  def test_exits_after_showing_help
    err = assert_raises SystemExit do
      @exiter.exit_after_showing_help
    end

    assert_equal 0, err.status
  end
end
