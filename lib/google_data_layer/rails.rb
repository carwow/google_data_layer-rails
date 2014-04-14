require "google_data_layer/rails/version"
require "google_data_layer/rails/config"

module GoogleDataLayer
  module Rails
    class Engine < ::Rails::Engine
      initializer "google_data_layer-rails.view_helpers" do
        ActionView::Base.send :include, GoogleDataLayerHelper
      end
    end
  end
end
