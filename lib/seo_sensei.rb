# frozen_string_literal: true

require 'meta-tags'
require 'seo_sensei/controllers/helpers'

ActiveSupport.on_load(:action_controller) do
  include ::SeoSensei::Controllers::Helpers
end
