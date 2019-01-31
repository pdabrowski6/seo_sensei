module SeoSensei
  module Lookups
    class Translation
      def self.call(controller_name, action_name, resource)
        translation_key = [
          SeoSensei.configuration.translation_key.to_s,
          controller_name,
          action_name
        ].join('.')

        return unless I18n.exists?(translation_key)

        translations = {}
        translation_attributes = ::SeoSensei::Lookups::TranslationAttributes.for(resource)

        I18n.t(translation_key).keys.each do |key|
          translations[key] = I18n.t("#{translation_key}.#{key}", translation_attributes.symbolize_keys)
        end
        
        translations
      end
    end
  end
end
