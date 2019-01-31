module SeoSensei
  module Lookups
    class TranslationAttributes
      def self.for(resource)
        if resource.respond_to?(:attributes)
          resource.attributes
        elsif resource.is_a?(Hash)
          resource
        else
          {}
        end
      end
    end
  end
end
