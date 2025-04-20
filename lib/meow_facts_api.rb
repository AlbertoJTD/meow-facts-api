# frozen_string_literal: true

require_relative './config/setup'
require_relative './meow_facts_api/error_handling'
require_relative './meow_facts_api/fetcher'
require_relative './meow_facts_api/errors'
require_relative './utils/constants'
require 'active_support'
require 'active_support/core_ext/hash'
require 'active_support/core_ext/object'

module MeowFactsApi
  extend ErrorHandling
  VALID_PARAMS = Fetcher::VALID_PARAMS

  class << self
    def fact(**params)
      sanitized_params = sanitize_params(params || {})
      check_language(sanitized_params['lang']) if sanitized_params['lang'].present?

      Fetcher.new(sanitized_params).call
    rescue StandardError => e
      handle_error(e)
    end

    private

    def sanitize_params(params)
      return {} if params.blank? || !params.is_a?(Hash)

      params = params.deep_stringify_keys.transform_keys(&:downcase)
      params.select { |key, _| VALID_PARAMS.include?(key) }
    end

    def check_language(language)
      language_supported = MeowFactsApi::SUPPORTED_LANGUAGES.find { |_, value| value.include?(language) }
      return if language_supported.present?

      raise LanguageNotSupportedError, "Language not supported: #{language}"
    end
  end
end
