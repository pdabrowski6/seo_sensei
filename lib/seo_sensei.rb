# frozen_string_literal: true

require 'meta-tags'
require 'seo_sensei/lookup'
require 'seo_sensei/controllers/helpers'
require 'seo_sensei/models/seo_tag'

ActiveSupport.on_load(:action_controller) do
  include ::SeoSensei::Controllers::Helpers
end

module SeoSensei
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :translation_key, :disable_seo, :disable_database_lookup

    def initialize
      @disable_database_lookup = false
      @disable_seo = true
      @translation_key = :seo
    end
  end
end
