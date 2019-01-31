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
      allow(SeoSensei::Lookup).to receive(:call).with(
        controller_name: 'articles', action_name: 'show'
      ).and_return(attributes)
      allow(FakeControllerClass).to receive(:set_meta_tags).with(attributes)

      FakeControllerClass.enable_seo

      expect(FakeControllerClass).to have_received(:set_meta_tags).with(
        attributes
      ).once
    end

    it 'does not set meta tags if the translated data is not found' do
      allow(SeoSensei::Lookup).to receive(:call).with(
        controller_name: 'articles', action_name: 'show'
      ).and_return(nil)
      allow(FakeControllerClass).to receive(:set_meta_tags)

      FakeControllerClass.enable_seo

      expect(FakeControllerClass).not_to have_received(:set_meta_tags)
    end
  end

  describe 'seo_tags_with' do
    let(:controller_name) { 'articles' }
    let(:action_name)     { 'show' }
    let(:resource)        { double('resource') }

    subject(:controller) { FakeControllerClass.new(controller_name, action_name) }

    it 'sets meta tags when translation is found' do
      translations = { title: 'title' }
      allow(SeoSensei::Lookup).to receive(:call).with(
        controller_name: controller_name, action_name: action_name, resource: resource
      ).and_return(translations)
      allow(controller).to receive(:set_meta_tags).with(translations)

      controller.seo_tags_with(resource)

      expect(controller).to have_received(:set_meta_tags).with(translations).once
    end

    it 'does not set meta tags when translation is not found' do
      allow(SeoSensei::Lookup).to receive(:call).with(
        controller_name: controller_name, action_name: action_name, resource: resource
      ).and_return(nil)
      allow(controller).to receive(:set_meta_tags)

      controller.seo_tags_with(resource)

      expect(controller).not_to have_received(:set_meta_tags)
    end
  end
end
