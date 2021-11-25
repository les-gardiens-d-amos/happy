class LeaderboardController < ApplicationController
  skip_before_action :authorized
  skip_before_action :check_is_admin

  def leaderboard
    users = User.all
    @leaderboard = []

    users.each do |el|
      amos = Amo.where(user_id: el.id)
      @leaderboard << count_user_amos(el.name, amos) unless amos.size.zero?
    end

    render json: { leaderboard: @leaderboard }
  end

  def global_stats
    render json: { message: "stats" }
  end

  private

  def count_user_amos(user_name, amos)
    {
      name: user_name,
      amos_count: amos.count,
      amos_type_count: amos.pluck(:animal_id).uniq.count,
      total_amos_level: amos.pluck(:level).sum,
      amos_type_prefer: find_most_amos(amos),
      last_catch: find_last_catch(amos.last)
    }
  end

  def find_most_amos(amos)
    amos_type = amos.pluck(:amos_type).tally
    amos_type.size.zero? ? nil : amos_type.first.first
  end

  def find_last_catch(amo)
    !amo.nil? ? amo.created_at : nil
  end
end
