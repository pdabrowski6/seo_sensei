module SeoSensei
  module Lookups
    class DefaultTranslation
      def self.call
        translation_key = [
          SeoSensei.configuration.translation_key.to_s,
          'default'
        ].join('.')

        return unless I18n.exists?(translation_key)

        I18n.t(translation_key)
      end
    end
  end
end
