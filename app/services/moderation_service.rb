class ModerationService
  def self.moderate(content)
    uri = URI("#{ENV['MODERATION_HOST']}/api/v1/moderations")

    body = {content: content}.to_json
    headers = { 'Content-Type' => 'application/json' }
    res = HTTParty.post(uri, body: body, headers: headers)

    JSON.parse(res.body)['contains_bad_words']
  end
end
