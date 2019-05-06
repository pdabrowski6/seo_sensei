module SeoSensei
  class SeoAttributes
    def initialize(translation, obj, url)
      @translation = translation
      @obj = obj
      @url = url
    end

    def call
      attributes = {}

      image_attributes = SeoSensei::Attributes::Image.call(resource)
      twitter_attributes = SeoSensei::Attributes::Twitter.call(resource)

      {
        og: {
          title: resource.title,
          description: resource.description,
          url: resource.url
        }.merge(image_attributes)
      }.merge(twitter_attributes)
    end

    private

    def resource
      @resource ||= SeoSensei::Resource.new(@translation, @obj, @url)
    end
  end
end
