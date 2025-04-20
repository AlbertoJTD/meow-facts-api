module MeowFactsApi
  module ErrorHandling
    def handle_error(error)
      {
        'error' => "Error fetching cat fact: #{error.class}: #{error.message}"
      }
    end
  end
end
