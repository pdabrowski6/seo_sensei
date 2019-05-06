# frozen_string_literal: true

module SeoSensei
  module Attributes
    module Image
      def self.call(resource)
        return {} unless resource.use_image?

        {
          image: resource.seo_image_url,
          "image:width" => resource.seo_image_width,
          "image:height" => resource.seo_image_height
        }
      end
    end
  end
end
