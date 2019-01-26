require 'spec_helper'
require 'pry'

describe SeoSensei::Controllers::Helpers do
  FakeControllerClass = Struct.new(:controller_name, :action_name) do
    include SeoSensei::Controllers::Helpers

    def set_meta_tags(attributes)

    end

    def self.before_action(options, &block)
      yield
    end

    def self.controller_name
      'articles'
    end

    def self.action_name
      'show'
    end
  end

  describe 'enable_seo' do
    it 'sets meta tags if the translated data is found' do
      attributes = { title: 'title' }
      allow(I18n).to receive(:t).with(
        'seo.articles.show', default: {}
      ).and_return(attributes)
      allow(FakeControllerClass).to receive(:set_meta_tags).with(attributes)

      FakeControllerClass.enable_seo

      expect(FakeControllerClass).to have_received(:set_meta_tags).with(
        attributes
      ).once
    end

    it 'does not set meta tags if the translated data is not found' do
      attributes = {}
      allow(I18n).to receive(:t).with(
        'seo.articles.show', default: {}
      ).and_return(attributes)
      allow(FakeControllerClass).to receive(:set_meta_tags)

      FakeControllerClass.enable_seo

      expect(FakeControllerClass).not_to have_received(:set_meta_tags)
    end
  end

  describe 'seo_tags_with' do
    let(:controller_name) { 'articles' }
    let(:action_name)     { 'show' }

    subject(:controller) { FakeControllerClass.new(controller_name, action_name) }

    context 'when an object with data is given' do
      let(:object) do
        double('article', attributes: { 'title' => 'Article 1'})
      end

      it 'does not set meta tags when translations are not found' do
        translated_seo = {}
        allow(I18n).to receive(:t).with(
          "seo.articles.show", default: {}
        ).and_return(translated_seo)
        allow(controller).to receive(:set_meta_tags)

        controller.seo_tags_with(object)

        expect(controller).not_to have_received(:set_meta_tags)
      end

      it 'sets meta tags when translations are found' do
        translated_seo = { title: 'Some title %{title}' }
        allow(I18n).to receive(:t).with(
          "seo.articles.show", default: {}
        ).and_return(translated_seo)
        translated_title = 'Some title Article 1'
        allow(I18n).to receive(:t).with(
          "seo.articles.show.title", object.attributes.symbolize_keys
        ).and_return(translated_title)
        allow(controller).to receive(:set_meta_tags).with(
          { title: translated_title }
        )

        controller.seo_tags_with(object)

        expect(controller).to have_received(:set_meta_tags).with(
          { title: translated_title }
        ).once
      end
    end

    context 'when a hash with data is given' do
      let(:attributes) do
        { title: 'Article 1' }
      end

      it 'does not set meta tags when translations are not found' do
        translated_seo = {}
        allow(I18n).to receive(:t).with(
          "seo.articles.show", default: {}
        ).and_return(translated_seo)
        allow(controller).to receive(:set_meta_tags)

        controller.seo_tags_with(attributes)

        expect(controller).not_to have_received(:set_meta_tags)
      end

      it 'sets meta tags when translations are found' do
        translated_seo = { title: 'Some title %{title}' }
        allow(I18n).to receive(:t).with(
          "seo.articles.show", default: {}
        ).and_return(translated_seo)
        translated_title = 'Some title Article 1'
        allow(I18n).to receive(:t).with(
          "seo.articles.show.title", attributes
        ).and_return(translated_title)
        allow(controller).to receive(:set_meta_tags).with(
          { title: translated_title }
        )

        controller.seo_tags_with(attributes)

        expect(controller).to have_received(:set_meta_tags).with(
          { title: translated_title }
        ).once
      end
    end
  end
end
