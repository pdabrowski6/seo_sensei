SeoSensei.configure do |config|
  config.disable_seo = Rails.env.test?
  config.translation_key = :seo
  config.disable_database_lookup = false
end
