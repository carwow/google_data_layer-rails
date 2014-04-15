require "google_data_layer/rails/version"
require "google_data_layer/rails/config"

module GoogleDataLayer
  module Rails
    class Engine < ::Rails::Engine
      initializer "google_data_layer-rails.view_helpers" do
        ActionView::Base.send :include, GoogleDataLayerHelper
      end

      initializer "google_data_layer-rails.load_config" do |app|
        file_path = "#{app.root}/config/google_data_layer.yml"
        unless File.exist?(file_path)
          raise "Please create a config file at: #{file_path}"
        end
        all_config = YAML.load(File.read(file_path)) || {}
        env_config = all_config[ENV['RAILS_ENV']] || {}
        Config.config = env_config
      end
    end
  end
end
