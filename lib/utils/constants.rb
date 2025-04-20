module MeowFactsApi
  BASE_URI = 'https://meowfacts.herokuapp.com/'.freeze

  VALID_PARAMS = %w[count id lang].freeze

  SUPPORTED_LANGUAGES = {
    'english': %w[eng eng-us],
    'czech': %w[ces-cz cze-cz cze ces],
    'german': %w[ger-de ger],
    'bengali': %w[ben-in ben],
    'spanish': %w[esp-es esp-mx esp],
    'russian': %w[rus-ru rus],
    'portuguese': %w[por-br por],
    'filipino': %w[tl-fil fil],
    'ukrainian': %w[ukr-ua ukr],
    'urdu': %w[urd-ur urd],
    'italian': %w[ita-it ita],
    'chinese': %w[zho-tw zho],
    'korean': %w[kor-ko kor]
  }.freeze
end
