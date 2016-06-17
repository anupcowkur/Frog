require 'exiter'

class SearchTermGetter
  def get_search_term
    search_term = ARGV[0]

    if search_term.nil?
      Exiter.new.exit_due_to_no_search_term
      return
    end

    return search_term
  end
end
