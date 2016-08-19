module Sportradar
  module Api
    class Nfl::GameStatistic < Data
      attr_accessor :response, :id, :efficiency, :first_downs, :interceptions, :touchdowns, :name, :market, :alias, :reference, :possession_time, :avg_gain, :safeties, :turnovers, :play_count, :rush_plays, :total_yards, :lost_fumbles, :penalty_yards, :return_yards

      # attr_writer :rushing, :receiving, :punts, :punt_returns, :penalties, :passing, :misc_returns, :kickoffs, :kick_returns, :int_returns, :fumbles, :field_goals, :extra_points, :defense # probably not necessary, but leaving here in case we want it later

      def initialize(data)
        @response        = data
        @id              = data["id"]
        @name            = data["name"]
        @market          = data["market"]
        @alias           = data["alias"]
        @reference       = data["reference"]
        @efficiency      = data["efficiency"]
        @first_downs     = data["first_downs"]
        @interceptions   = data["interceptions"]
        @touchdowns      = data["touchdowns"]
        @possession_time = data["possession_time"]
        @avg_gain        = data["avg_gain"]
        @safeties        = data["safeties"]
        @turnovers       = data["turnovers"]
        @play_count      = data["play_count"]
        @rush_plays      = data["rush_plays"]
        @total_yards     = data["total_yards"]
        @lost_fumbles    = data["lost_fumbles"]
        @penalty_yards   = data["penalty_yards"]
        @return_yards    = data["return_yards"]
      end
      def rushing
        @rushing       ||= Sportradar::Api::Nfl::Stat::Rushing.new(response["rushing"])
      end
      def receiving
        @receiving     ||= Sportradar::Api::Nfl::Stat::Receiving.new(response["receiving"])
      end
      def punts
        @punts         ||= Sportradar::Api::Nfl::Stat::Punts.new(response["punts"])
      end
      def punt_returns
        @punt_returns  ||= Sportradar::Api::Nfl::Stat::PuntReturns.new(response["punt_returns"])
      end
      def penalties
        @penalties     ||= Sportradar::Api::Nfl::Stat::Penalties.new(response["penalties"])
      end
      def passing
        @passing       ||= Sportradar::Api::Nfl::Stat::Passing.new(response["passing"])
      end
      def misc_returns
        @misc_returns  ||= Sportradar::Api::Nfl::Stat::MiscReturns.new(response["misc_returns"])
      end
      def kickoffs
        @kickoffs      ||= Sportradar::Api::Nfl::Stat::Kickoffs.new(response["kickoffs"])
      end
      def kick_returns
        @kick_returns  ||= Sportradar::Api::Nfl::Stat::KickReturns.new(response["kick_returns"])
      end
      def int_returns
        @int_returns   ||= Sportradar::Api::Nfl::Stat::IntReturns.new(response["int_returns"])
      end
      def fumbles
        @fumbles       ||= Sportradar::Api::Nfl::Stat::Fumbles.new(response["fumbles"])
      end
      def field_goals
        @field_goals   ||= Sportradar::Api::Nfl::Stat::FieldGoals.new(response["field_goals"])
      end
      def extra_points
        @extra_points  ||= Sportradar::Api::Nfl::Stat::ExtraPoints.new(response["extra_points"])
      end
      def defense
        @defense       ||= Sportradar::Api::Nfl::Stat::Defense.new(response["defense"])
      end
        
    end
  end
end
