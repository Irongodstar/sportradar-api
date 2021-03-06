module Sportradar
  module Api
    module Football
      class Quarter < Data
        attr_accessor :response, :api, :id, :number, :sequence, :home_points, :away_points, :scoring

        def initialize(data, **opts)
          @response = data
          @id = data[self.class.period_index]
          @api = opts[:api]

          @drives_hash = {}

          update(data, **opts)
        end

        def update(data, **opts)
          @number       = data["number"]
          @sequence     = data["sequence"]
          @home_points  = data["home_points"]
          @away_points  = data["away_points"]

          @home_info = data["home"]
          @away_info = data["away"]

          if data['pbp']
            opts[:game].update_drives(data['pbp'], quarter: self)
            create_data(@drives_hash, data['pbp'], klass: drive_class, api: api, quarter: self)
          end

          self
        end

        def overtime?
          (@sequence || @number) > 4
        end

        def drives
          @drives_hash.values
        end

        def drive_class
          Drive
        end

      end
    end
  end
end
