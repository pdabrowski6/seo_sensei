# frozen_string_literal: true

module SeoSensei
  module Attributes
    module Twitter
      def self.call(seo_translation, resource, url)
        image_attributes = SeoSensei::Attributes::Image.call(resource)

        base_attributes = {
          title: seo_translation['title'],
          description: seo_translation['description'],
          url: url
        }

        unless image_attributes[:image].nil?
          base_attributes.merge!(
            image: image_attributes[:image],
            card: 'summary_large_image'
          )
        end

        { twitter: base_attributes }
      end
    end
  end
end
