class Exiter
  def exit_due_to_no_search_term
    abort "You need to provide a class to search for".red
  end

  def exit_due_to_doc_not_found
    abort "Sorry. It looks like we couldn't find what you were looking for".red
  end

  def exit_due_to_incorrect_index
    abort "Sorry. It looks like you didn't enter the correct index".red
  end

  def exit_due_to_net_http_fail_during_links_update
    exit
  end

  def exit_after_showing_help
    exit
  end
end
