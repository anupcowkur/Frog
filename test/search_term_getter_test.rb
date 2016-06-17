require 'test_helper'

class TestSearchTermGetter < Minitest::Test

  def test_that_it_gets_search_term
    ARGV.clear
    ARGV << "searchyterm"

    assert_equal  "searchyterm", SearchTermGetter.new.get_search_term
  end

  def test_that_it_errors_out_if_search_term_is_not_entered
    ARGV.clear

    Exiter.any_instance.expects(:exit_due_to_no_search_term)
    SearchTermGetter.new.get_search_term
  end
end
