module SeoSensei
  class Resource
    def initialize(translation, obj, url)
      @translation = translation
      @obj = obj
      @url = url
    end

    def url
      @url
    end

    def title
      @translation[:title]
    end

    def description
      @translation[:description]
    end

    def keywords
      @translation[:keywords]
    end

    def use_image?
      use_obj_image? || use_translation_image?
    end

    def seo_image_url
      if use_obj_image?
        @obj.seo_image_url
      elsif use_translation_image?
        @translation[:seo_image_url]
      end
    end

    def seo_image_width
      if use_obj_image?
        @obj.seo_image_dimensions[:width].to_s
      elsif use_translation_image?
        @translation[:seo_image_width]
      end
    end

    def seo_image_height
      if use_obj_image?
        @obj.seo_image_dimensions[:height].to_s
      elsif use_translation_image?
        @translation[:seo_image_height]
      end
    end

    private

    def use_obj_image?
      !@obj.nil? &&
        @obj.respond_to?(:use_seo_image?) &&
        @obj.use_seo_image?
    end

    def use_translation_image?
      !@translation[:seo_image_url].nil? &&
        !@translation[:seo_image_width].nil? &&
        !@translation[:seo_image_height].nil?
    end
  end
end
