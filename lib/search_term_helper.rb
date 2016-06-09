require_relative 'exiter'

class SearchTermHelper
  def initialize(exiter)
    @exiter = exiter
  end

  def get_search_term
    search_term = ARGV[0]

    if search_term.nil?
      @exiter.exit_due_to_no_search_term
      return
    end

    return search_term
  end
end
