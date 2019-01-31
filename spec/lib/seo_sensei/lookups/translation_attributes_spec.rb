require 'spec_helper'

describe SeoSensei::Lookups::TranslationAttributes do
  describe '.for' do
    it 'resource attributes when resource responds to attributes' do
      attributes = { title: 'title' }
      resource = double(attributes: attributes)

      expect(described_class.for(resource)).to eq(attributes)
    end

    it 'returns resource when resource is a hash' do
      attributes = { title: 'title' }

      expect(described_class.for(attributes)).to eq(attributes)
    end

    it 'returns blank hash when resource is not a hash and does not respond to attributes' do
      expect(described_class.for(nil)).to eq({})
    end
  end
end
