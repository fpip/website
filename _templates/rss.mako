<?xml version="1.0" encoding="UTF-8"?><% from datetime import datetime %>
<rss version="2.0"
     xmlns:content="http://purl.org/rss/1.0/modules/content/"
     xmlns:sy="http://purl.org/rss/1.0/modules/syndication/"
     xmlns:atom="http://www.w3.org/2005/Atom"
     xmlns:wfw="http://wellformedweb.org/CommentAPI/"
     xmlns:dc="http://purl.org/dc/elements/1.1/"
     xmlns:itunes="http://www.itunes.com/dtds/podcast-1.0.dtd"
     >
  <channel>
    <title>${bf.config.blog.name}</title>
    <link>${bf.config.blog.url}</link>
    <description>${bf.config.blog.description}</description>
    <pubDate>${datetime.utcnow().strftime("%a, %d %b %Y %H:%M:%S GMT")}</pubDate>
    <generator>Blogofile</generator>
    <language>en</language>
##  <atom10:link xmlns:atom10="http://www.w3.org/2005/Atom" rel="self" type="application/rss+xml" href="http://feeds.feedburner.com/FromPythonImportPodcast" />
    <sy:updatePeriod>hourly</sy:updatePeriod>
    <sy:updateFrequency>1</sy:updateFrequency>
% if podcast:
    <itunes:summary>${podcast.summary}</itunes:summary>
    <itunes:image href="${bf.config.site.url}${podcast.image}" />
    <itunes:subtitle>${podcast.subtitle}</itunes:subtitle>
    <itunes:keywords>${podcast.keywords}</itunes:keywords>
    <itunes:explicit>${podcast.explicit}</itunes:explicit>
    <itunes:author>${podcast.owner_name}</itunes:author>
    <itunes:owner>
        <itunes:name>${podcast.owner_name}</itunes:name>
        <itunes:email>${podcast.owner_email}</itunes:email>
    </itunes:owner>

##  TODO: Make me dynamic! ~mcrute
    <itunes:category text="Technology" />
    <itunes:category text="Business">
        <itunes:category text="Careers" />
    </itunes:category>
    <itunes:category text="Education">
        <itunes:category text="Training" />
    </itunes:category>
% endif
% for post in posts[:10]:
    <item>
      <title>${post.title}</title>
      <link>${post.permalink}</link>
      <dc:creator>${post.author}</dc:creator>
      <pubDate>${post.date.strftime("%a, %d %b %Y %H:%M:%S %Z")}</pubDate>
% for category in post.categories:
      <category><![CDATA[${category}]]></category>
% endfor
% if post.guid:
      <guid>${post.guid}</guid>
% else:
      <guid isPermaLink="true">${post.permalink}</guid>
% endif
      <description>${post.title}</description>
      <content:encoded><![CDATA[${post.content}]]></content:encoded>
% if post.mp3_file:
      <enclosure url="http://frompythonimportpodcast.com/${post.mp3_file}" length="${post.mp3_size}" type="audio/mpeg" />
      <itunes:subtitle>${post.excerpt}</itunes:subtitle>
      <itunes:summary>${post.content}</itunes:summary>
      <itunes:author>${podcast.owner_name}</itunes:author>
      <itunes:explicit>${podcast.explicit}</itunes:explicit>
      <itunes:duration>${post.duration}</itunes:duration>
% endif
    </item>
% endfor
  </channel>
</rss>
