module SeoSensei
  module Models
    class SeoTag < ::ActiveRecord::Base
      belongs_to :seoable, polymorphic: true

      def to_h
        slice("title", "keywords", "description")
      end
    end
  end
end
