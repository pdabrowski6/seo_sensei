require 'spec_helper'

describe SeoSensei::Lookups::DefaultTranslation do
  let(:translation_key) { :seo }
  let(:default_translation_key) { 'seo.default' }

  before do
    allow(SeoSensei.configuration).to receive(
      :translation_key
    ).and_return(translation_key)
  end

  describe '.call' do
    it 'returns nil when default translation does not exist' do
      allow(I18n).to receive(:exists?).with(
        default_translation_key
      ).and_return(false)

      expect(described_class.call).to eq(nil)
    end

    it 'returns default translation when exists' do
      translations = { title: 'title' }
      allow(I18n).to receive(:exists?).with(
        default_translation_key
      ).and_return(true)
      allow(I18n).to receive(:t).with(
        default_translation_key
      ).and_return(translations)

      expect(described_class.call).to eq(translations)
    end
  end
end
