require 'spec_helper'

describe SeoSensei::Lookups::Database do
  describe '.call' do
    it 'returns nil when database lookup is disabled' do
      allow(SeoSensei.configuration).to receive(
        :disable_database_lookup
      ).and_return(true)

      expect(described_class.call(double)).to eq(nil)
    end

    context 'when database lookup is enabled' do
      before do
        allow(SeoSensei.configuration).to receive(
          :disable_database_lookup
        ).and_return(false)
      end

      it 'returns nil when resource is not given' do
        expect(described_class.call(nil)).to eq(nil)
      end

      it 'returns nil when resource is hash' do
        expect(described_class.call({})).to eq(nil)
      end

      it 'returns seo tag' do
        resource = double('resource')
        seo_tag = double('seo_tag')
        allow(SeoSensei::Models::SeoTag).to receive(:find_by).with(
          seoable: resource
        ).and_return(seo_tag)

        expect(described_class.call(resource)).to eq(seo_tag)
      end
    end
  end
end
