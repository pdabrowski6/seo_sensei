# frozen_string_literal: true

module SeoSensei
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      class_methods do
        def enable_seo(options = {})
          before_action(options) do
            resource_name = options.delete(:for) || controller_name
            if (translated_seo = ::SeoSensei::Lookup.call(controller_name: resource_name, action_name: action_name))
              set_meta_tags(translated_seo)
            end
          end
        end

        def disable_seo(options = {})
          before_action(options) do
            set_meta_tags(noindex: true)
          end
        end
      end

      def seo_tags_with(resource)
        if (translated_seo = ::SeoSensei::Lookup.call(controller_name: controller_name, action_name: action_name, resource: resource))
          set_meta_tags(translated_seo)
        end
      end
    end
  end
end
