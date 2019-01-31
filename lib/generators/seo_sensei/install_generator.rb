# frozen_string_literal: true

require 'rails/generators/base'

module SeoSensei
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a SeoSensei initializer and copy locale file to your application."
    
      def copy_initializer
        template "seo_sensei.rb", "config/initializers/seo_sensei.rb"
      end

      def copy_migration
        template "migration.rb", "db/migrate/#{Time.now.strftime('%Y%m%d%H%M')}_create_seo_sensei.rb", migration_version: migration_version
      end

      def copy_locale
        copy_file "../../../config/locales/en.yml", "config/locales/seo_sensei.en.yml"
      end

      private

      def rails5_and_up?
        Rails::VERSION::MAJOR >= 5
      end

      def migration_version
        if rails5_and_up?
          "[#{Rails::VERSION::MAJOR}.#{Rails::VERSION::MINOR}]"
        end
      end
    end
  end
end
