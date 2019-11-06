class PostsService
  def self.index(current_user)
    uri = URI("#{base_url}/posts")
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => token(current_user)
    }

    res = HTTParty.get(uri, headers: headers)
    JSON.parse(res.body)["posts"]
  end

  def self.show(current_user, id)
    uri = URI("#{base_url}/posts/#{id}")
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => token(current_user)
    }

    res = HTTParty.get(uri, headers: headers)
    JSON.parse(res.body)["post"]
  end

  def self.create(current_user, title, content)
    uri = URI("#{base_url}/posts")

    body = {
      title: title,
      content: content
    }.to_json

    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => token(current_user)
    }

    res = HTTParty.post(uri, body: body, headers: headers)
    parsed_response = JSON.parse(res.body)
    errors = parsed_response['error']
    post = parsed_response ['post']

    return { errors: errors } if errors.present?

    post
  end

  private

  def self.base_url
    ENV['CONTENT_MANAGEMENT_HOST']
  end

  def self.token(current_user)
    current_user.jwt_token
  end
end
