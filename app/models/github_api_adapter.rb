module GitHubApiAdapter
    # use httparty
    # OR net/http and URI
    # to make web request to GitHub API
    # and store/parse the JSON return

    # {
    #   repo1: fbfldjsfbja
    #   repo2: jfkdlsjlfdas
    # }

  def self.get_github_user_info(username)

    require 'uri'
    require 'net/http'

    url = URI("https://api.github.com/users/#{username}/repos")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '1b372cee-d5bb-ff13-99ff-da9d9f785222'

    response = http.request(request)
    puts response.read_body
    p response
    # return parse_github_return_data(data)
  end

# private
#   def self.parse_github_return_data(data)
#     # generate an array that can be used by controller/view
#   end
end
