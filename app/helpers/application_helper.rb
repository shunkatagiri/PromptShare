module ApplicationHelper
  def twitter_share_url(options = {})
    tweet_text = ERB::Util.url_encode("Check out this template: #{options[:title]}")
    tweet_url = ERB::Util.url_encode(options[:url])
    "https://twitter.com/share?url=#{tweet_url}&text=#{tweet_text}"
  end
end
