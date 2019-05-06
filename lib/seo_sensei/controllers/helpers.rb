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
              attributes_service = ::SeoSensei::SeoAttributes.new(
                translated_seo, nil, url_for(only_path: false)
              )

              set_meta_tags(attributes_service.call)
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
          attributes_service = ::SeoSensei::SeoAttributes.new(
            translated_seo, resource, url_for(only_path: false)
          )

          set_meta_tags(attributes_service.call)
        end
      end
    end
  end
end
