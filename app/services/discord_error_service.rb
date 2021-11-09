require 'discordrb/webhooks'

class DiscordErrorService
  def initialize(request, params, error, stack_trace)
    @request = request
    @params = params
    @error = error
    @stack_trace = stack_trace
    @smiley = ["🚀", "🍕", "😅", "☕", "🤖", "🛰️", "🍔"]
    @url_webhook = ENV["DISCORD_WEBHOOKS"]
  end

  def send_error_back
    @stack_trace = @stack_trace.slice(0, @stack_trace.length / 6)
    send_error("REQUEST", "PARAMS")
  end

  def send_error_front
    send_error("DESCRIPTION", "DESCRIPTION")
  end

  def send_error(request, params)
    client = Discordrb::Webhooks::Client.new(url: @url_webhook)
    client.execute do |builder|
      builder.content = 'An error has occurred ! ' + random_smiley
      builder.add_embed do |embed|
        embed.title = @error.to_s
        embed.description = "#{request} : \n \n"
        embed.description += @request.to_s
        embed.description = "\n \n #{params} : \n \n"
        embed.description += @params.to_s
        embed.description += "\n \n STACK TRACE : \n \n"
        embed.description += @stack_trace.to_s
        embed.timestamp = Time.now
      end
    end
  end

  def random_smiley
    @smiley[rand(0..@smiley.length - 1)]
  end
end