# frozen_string_literal: true

module SeoSensei
  module Attributes
    module Twitter
      def self.call(resource)
        base_attributes = {
          title: resource.title,
          description: resource.description,
          url: resource.url
        }

        if resource.use_image?
          base_attributes.merge!(
            image: resource.seo_image_url,
            card: 'summary_large_image'
          )
        end

        { twitter: base_attributes }
      end
    end
  end
end
