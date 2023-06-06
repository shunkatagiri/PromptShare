# app/helpers/application_helper.rb

module ApplicationHelper
  def twitter_share_url(template)
    title = template.title
    url = template_url(template)
    "https://twitter.com/share?url=#{url}&text=新しいテンプレートを投稿しました：#{title}"
  end
end
