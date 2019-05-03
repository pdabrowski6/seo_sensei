# frozen_string_literal: true

module SeoSensei
  module Attributes
    module Og
      def self.call(seo_translation, resource, url)
        image_attributes = SeoSensei::Attributes::Image.call(resource)

        base_attributes = {
          title: seo_translation.title,
          description: seo_translation.description,
          url: url
        }

        { og: base_attributes.merge(image_attributes) }
      end
    end
  end
end
