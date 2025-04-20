module MeowFactsApi
  module ErrorHandling
    def handle_error(error)
      {
        'error' => "#{error.class}: #{error.message}"
      }
    end
  end
end
