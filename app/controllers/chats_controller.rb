class ChatsController < ApplicationController
include ApplicationController:::Live
    before_action :authenticate_user!
    def show
      response.header['Content_Type'] = 'text/event-stream'
      response.header['Last-Modified'] = Time.now.httpdate
                                        = SSE.new(response.stream, event: "message")
                                        = OpenAI::Client.new(access_token: )

    begin
      client.chat(
        parameters: {
          model: "gpt-3.5-turbo",
          messages: [{role: "user", content: params[:prompt]}],
          stream: proc do |chunks|
            content = chunks.dig("choices", 0, "delta","content")
            return if content.nil?
            SSE.write(object {message: content})
          end
        }
      )
      ensure
        sse.close
      end
    end
  end