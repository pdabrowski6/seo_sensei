require 'seo_sensei/lookups/database'
require 'seo_sensei/lookups/translation_attributes'
require 'seo_sensei/lookups/translation'
require 'seo_sensei/lookups/default_translation'

module SeoSensei
  class Lookup
    def self.call(controller_name:, action_name:, resource: nil)
      lookup = ::SeoSensei::Lookups::Database.call(resource) ||
        ::SeoSensei::Lookups::Translation.call(controller_name, action_name, resource) ||
        ::SeoSensei::Lookups::DefaultTranslation.call

      lookup.to_h.presence
    end
  end
end
