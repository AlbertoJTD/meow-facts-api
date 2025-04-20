# frozen_string_literal: true

RSpec.describe MeowFactsApi do
  it 'has a version number' do
    expect(MeowFactsApi::VERSION).not_to be nil
  end

  context '.fact' do
    let(:successful_response) do
      {
        'data' => ['Cats have been domesticated for around 4,000 years.']
      }.to_json
    end

    before do
      allow(Net::HTTP).to receive(:get_response).and_return(
        instance_double(Net::HTTPResponse, body: successful_response)
      )
    end

    it 'returns a cat fact when the API call is successful' do
      result = described_class.fact
      expect(result).to be_a(Hash)
      expect(result['data']).to be_an(Array)
      expect(result['data'].first).to be_a(String)
      expect(result.keys).to include('data')
    end

    context 'supported language' do
      it 'returns a cat fact in the supported language' do
        lang = 'eng-us'
        result = described_class.fact(lang:)

        expect(result).to be_a(Hash)
        expect(result['data']).to be_an(Array)
        expect(result.keys).to include('data')
      end

      it 'returns cat fact with uppecase params'
      it 'ignore extra params'
    end

    context 'language not supported' do
      it 'returns error hash for unsupported language' do
        lang = 'invalid_language'
        result = described_class.fact(lang:)

        expect(result).to eq({
          'error' => "MeowFactsApi::LanguageNotSupportedError => Language not supported: #{lang}"
        })
      end

      it 'returns an error with less than 0 facts'
      it 'returns an error with invalid language and a valid count'
    end
  end
end
