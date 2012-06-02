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
    <atom:link href="http://feeds.feedburner.com/FromPythonImportPodcast" rel="self" type="application/rss+xml" />
    <sy:updatePeriod>hourly</sy:updatePeriod>
    <sy:updateFrequency>1</sy:updateFrequency>
% if podcast:
    <itunes:summary>${podcast.itunes_summary}</itunes:summary>
    <itunes:image href="${bf.config.site.url}${podcast.image}" />
    <itunes:subtitle>${podcast.subtitle}</itunes:subtitle>
    <itunes:keywords>${podcast.keywords}</itunes:keywords>
    <itunes:explicit>${podcast.explicit}</itunes:explicit>
    <itunes:author>${podcast.owner_name}</itunes:author>
    <itunes:owner>
        <itunes:name>${podcast.owner_name}</itunes:name>
        <itunes:email>${podcast.owner_email}</itunes:email>
    </itunes:owner>
<%def name="podcast_categories()">
% for category in podcast.categories:
    % if not hasattr(category, 'extend'):
        <itunes:category text="${category}" />
    % elif len(category) == 1:
        <itunes:category text="${category[0]}" />
    % elif len(category) > 1:
        <itunes:category text="${category[0]}">
        % for subcategory in category[1:]:
            <itunes:category text="${subcategory}" />
        %endfor
        </itunes:category>
    %endif
% endfor
</%def>
    ${podcast_categories()}
% endif
% for post in posts[:20]:
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
% if (enclosure_flavor == 'mp3' or not enclosure_flavor) and post.mp3_file:
      <enclosure url="http://frompythonimportpodcast.com/${post.mp3_file}" length="${post.mp3_size}" type="audio/mpeg" />
      <itunes:subtitle>${post.excerpt}</itunes:subtitle>
      <itunes:summary>${post.itunes_summary}</itunes:summary>
      <itunes:author>${podcast.owner_name}</itunes:author>
      <itunes:explicit>${podcast.explicit}</itunes:explicit>
      <itunes:duration>${post.duration}</itunes:duration>
% elif enclosure_flavor == 'ogg' and post.ogg_file:
      <enclosure url="http://frompythonimportpodcast.com/${post.ogg_file}" length="${post.ogg_size}" type="audio/ogg" />
      <itunes:subtitle>${post.excerpt}</itunes:subtitle>
      <itunes:summary>${post.itunes_summary}</itunes:summary>
      <itunes:author>${podcast.owner_name}</itunes:author>
      <itunes:explicit>${podcast.explicit}</itunes:explicit>
      <itunes:duration>${post.duration}</itunes:duration>
% else:
% endif
    </item>
% endfor
  </channel>
</rss>
