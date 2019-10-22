class ModerationService
  def self.moderate(content)
    uri = URI("#{ENV['MODERATION_HOST']}/api/v1/moderations")

    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')

    req.body = {content: content}.to_json

    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    JSON.parse(res.body)['contains_bad_words']
  end
end
