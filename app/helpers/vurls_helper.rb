module VurlsHelper
  def default_keywords
    'shorten url vurl long tinyurl rubyurl is.gd bit.ly ruby rails veez veezus kreist'
  end

  def default_description
    'Vurl shortens your long URLs - an app by Veezus Kreist'
  end

  def display_stats_link?
    !(controller_name == 'vurls' && action_name == 'stats')
  end

  def title_or_truncated_url(vurl)
    vurl.title.present? ? vurl.title : truncate(vurl.url, length: 50)
  end

  def absolute_url_for(url)
    %r{^https?://} =~ url ? url : "http://#{url}"
  end
end
