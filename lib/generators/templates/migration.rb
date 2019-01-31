# frozen_string_literal: true

class CreateSeoSensei < ActiveRecord::Migration<%= migration_version %>
  def change
    create_table :seo_tags do |t|
      t.references :seoable, polymorphic: true
      t.string :title
      t.string :keywords
      t.string :description
      
      t.timestamps null: false
    end
  end
end
