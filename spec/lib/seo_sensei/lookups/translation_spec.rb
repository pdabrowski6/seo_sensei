require 'spec_helper'

describe SeoSensei::Lookups::Translation do
  describe '.call' do
    let(:translation_key) { :seo }
    let(:controller_name) { 'articles' }
    let(:action_name)     { 'show' }
    let(:key) { 'seo.articles.show' }

    before do
      allow(SeoSensei.configuration).to receive(
        :translation_key
      ).and_return(translation_key)
    end

    it 'returns nil when translation does not exist' do
      allow(I18n).to receive(:exists?).with(
        key
      ).and_return(false)

      expect(described_class.call(controller_name, action_name, nil)).to eq(nil)
    end

    context 'when translation exists' do
      it 'returns translations' do
        allow(I18n).to receive(:exists?).with(
          key
        ).and_return(true)
        attributes = { title: 'Title' }
        resource = double('resource')
        allow(SeoSensei::Lookups::TranslationAttributes).to receive(:for).with(
          resource
        ).and_return(attributes)
        translations = { title: 'This is title %{title}' }
        allow(I18n).to receive(:t).with(key).and_return(translations)
        allow(I18n).to receive(:t).with("#{key}.title", attributes).and_return('translated title')

        expect(described_class.call(
          controller_name, action_name, resource
        )).to eq({ title: 'translated title' })
      end
    end
  end
end
