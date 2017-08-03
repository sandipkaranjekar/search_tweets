module Twitter
  class TwitterAPI
    CONSUMER_KEY = URI::encode("P2Osw2XA6FAJvUSYnGkTnOXmu")
    CONSUMER_SECRET = URI::encode("TKo6gaKbUspJTELitT7vrmCW6pQC10XSuNLt6Qo3uHRP4DdwJC")
    BEARER_TOKEN_CREDIENTIAL = Base64.encode64("#{TwitterAPI::CONSUMER_KEY}:#{TwitterAPI::CONSUMER_SECRET}").gsub("\n","")

    # api - https://api.twitter.com/oauth2/token
    # input - consumer key and consumer secret
    # ouput - Bearer access token
    # doc - https://dev.twitter.com/oauth/application-only
    def initialize
      response = RestClient.post 'https://api.twitter.com/oauth2/token', {"grant_type" => 'client_credentials'}, {"Authorization" => "Basic #{TwitterAPI::BEARER_TOKEN_CREDIENTIAL}", "Content-Type" => "application/x-www-form-urlencoded;charset=UTF-8"}
      @@access_token = JSON.parse(response)["access_token"]
    end

    # api - https://api.twitter.com/1.1/search/tweets.json
    # input - q (querystring)
    # ouput - serached tweets
    # doc - https://dev.twitter.com/rest/reference/get/search/tweets
    def search(q)
      search_reponse = RestClient.get "https://api.twitter.com/1.1/search/tweets.json?q=%23#{q}", {"Authorization" => "Bearer #{@@access_token}"}      
      search_reponse = JSON.parse(search_reponse)
    end
  end # class end
end