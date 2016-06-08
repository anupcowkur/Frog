class ErrorHandler
	def handle_no_search_term
		abort "You need to provide a class to search for"
	end
	
	def handle_doc_not_found
		abort "Sorry. It looks like we couldn't find what you were looking for"
	end

	def handle_incorrect_index
		abort "Sorry. It looks like you didn't enter the correct index"
	end
end