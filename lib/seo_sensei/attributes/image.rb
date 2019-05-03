# frozen_string_literal: true

module SeoSensei
  module Attributes
    module Image
      def self.call(resource)
        return {} unless resource.respond_to?(:use_seo_image?) && resource.use_seo_image?

        {
          image: resource.seo_image_url,
          "image:width" => resource.seo_image_dimensions[:width].to_s,
          "image:height" => resource.seo_image_dimensions[:height].to_s
        }
      end
    end
  end
end
