module SeoSensei
  module Lookups
    class Database
      def self.call(resource)
        return if SeoSensei.configuration.disable_database_lookup
        return if resource.blank? || resource.is_a?(Hash)

        ::SeoSensei::Models::SeoTag.find_by(seoable: resource)
      end
    end
  end
end
