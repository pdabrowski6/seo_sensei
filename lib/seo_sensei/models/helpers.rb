# frozen_string_literal: true

module SeoSensei
  module Models
    module Helpers
      extend ActiveSupport::Concern

      class_methods do
        def has_seo_tags
          has_one :seo_tags, class_name: 'SeoSensei::Models::SeoTag', as: :seoable
          accepts_nested_attributes_for :seo_tags
        end
      end
    end
  end
end
