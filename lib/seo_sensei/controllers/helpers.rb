# frozen_string_literal: true

module SeoSensei
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      class_methods do
        def enable_seo(options = {})
          before_action(options) do
            resource_name = options.delete(:for) || controller_name
            translated_seo = I18n.t("seo.#{resource_name}.#{action_name}", default: {})
            set_meta_tags(translated_seo) if translated_seo.present?
          end
        end
      end

      def seo_tags_with(resource)
        attributes = resource.kind_of?(Hash) ? resource : resource.attributes
        translated_seo = I18n.t("seo.#{controller_name}.#{action_name}", default: {})
        seo_attributes = translated_seo.keys.inject({}) do |h, k|
          h[k] = I18n.t("seo.#{controller_name}.#{action_name}.#{k.to_s}", attributes.symbolize_keys)
          h
        end
      
        set_meta_tags(seo_attributes) if seo_attributes.present?
      end
    end
  end
end
