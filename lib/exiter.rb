class Exiter
  def exit_due_to_no_search_term
    abort "You need to provide a class to search for"
  end

  def exit_due_to_doc_not_found
    abort "Sorry. It looks like we couldn't find what you were looking for"
  end

  def exit_due_to_incorrect_index
    abort "Sorry. It looks like you didn't enter the correct index"
  end

  def exit_after_showing_help
    exit
  end
end
