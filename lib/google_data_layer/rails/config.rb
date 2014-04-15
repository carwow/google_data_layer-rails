module GoogleDataLayer
  module Rails
    class Config
      def self.google_id
        @@config['google_id']
      end

      def self.config=(config)
        @@config = config
      end
    end
  end
end
