---
categories: Announcements
author: Mike Pirnat
date: 2013/09/09 14:24:00
title: A Rackspace Odyssey
---
<div class="excerpt" markdown="1">
This is going to be a lot longer than the things we usually post; buckle up.

One of our obstacles in recording and releasing new episodes has been some
hosting issues that resulted from a server relocation that never quite put
everything back in place correctly, and the people who could fix them were those
of us who had the least amount of time to do so.  I'd been thinking for some
time about moving the site to a hosting solution that wouldn't result in those
kinds of bottlenecks any more, so when [Rackspace][rackspace] community advocate
[Jesse Noller][jnoller] started announcing [free accounts][accounts] for open
source and community projects this summer, I jumped at the chance to shake
things up.

I'm very pleased to announce that we've now fully migrated over to the new
setup, and so far things are pretty darn good.
</div>

Full disclosure time--in exchange for getting the awesome hookup, we've been
asked to:

 1. Link to Rackspace on the site (you'll see some bling in the sidebar and
    footer now)
 2. Mention Rackspace in episodes (you'll hear a PBS-style "made possible by"
    blurb in all future shows)
 3. Write a blog post about our experience (spoiler alert--you're already
    reading it!)

As I got our new setup going, I took extensive, stream-of-consciousness notes so
that I could capture everything that I was thinking and feeling. I'm going to
spare you from them and instead attempt to boil it all down into what I found to
be the positive and negative experiences of getting everything working.

##### Account Creation & Initial Experience

Creating an account was pretty straightforward.  The only thing I struggled with
was coming up with a username that fit the requirement of being more than six
characters (I had intended to use "fpip", our short abbreviation for "From
Python Import Podcast").  Rackspace sent some really good follow-up emails as
the account was created that helped me want to start doing things right away.
The welcome videos were a nice high point as well; more companies--in any
market--should provide this kind of high-level tour of their products.

However, the quick start guide linked to from one of the welcome emails was a
disappointment--the knowledge center article it brought me to was pretty
minimal, mostly containing links to things that didn't feel very quick startish
to me: info about support levels, about monitoring service, about patching, and
a video about creating a server with a managed service level.  That's all either
really dry, not what I'm looking for, or not applicable to our unmanaged
account.  For me, a quick start guide should be a "here's how you Rackspace for
dummies" sort of thing.

##### Creating a Server

So, instead of reading the quick start that wasn't, I just jumped in and made a
server.  The control panel web interface makes this super-easy, offering a ton
of different starting images and memory/storage combinations.  This interface
also lets you choose a region for your image to live in (basically, which data
center it will be hosted in).  Since I'm in the US, the choice of the DC area,
Dallas, or Chicago didn't make a lot of difference to me (Sydney might be
important if you're outside the US), but the most important advice is that you
aren't going to get charged for data for chatter between boxes that are inside
the same region, but will be charged for data that crosses from one region to
another, so you want to keep all the things that will communicate all in the
same region.

One nice thing about the control panel interface is that any time you're going
to go do things, you'll get some extra context with helpful text and links to
offer how-tos and advice.  This is a great feature that again I'd like to see
other people implement.  I especially liked that the server creation came with
guidance for logging in and getting at least a basic level of security going.
*However*, the knowledge center articles that are linked again don't always
contain all the information that one might expect them to, which in some cases
left me scrambling to fill in the blanks.  The basic security documentation, for
example, does a great job of going through things in a n00b-friendly,
step-by-step way, only to completely omit the explanation of how to set up
iptables rules.  Since I've been out of the amateur sysadmin game for at least a
decade, the "create /etc/iptables.test.rules and add some rules" instruction
left me feeling really stupid and more than a little annoyed.

That said, I *did* have a shiny, fresh Ubuntu box in just a few short moments,
and I was able to quickly get the basics (git, make, nginx, etc.) installed and
running.

##### Cloud Files & CDN

I could have just uploaded all of our audio files to the new server and call it
done, but Rackspace offers a cloud storage solution similar to Amazon's S3, and
makes it trivial to provide public access to it via [Akamai][akamai]'s content
distribution network.  CDNs rule for publishing big, static content like audio
and video, making them quickly and redundantly available around the world, so I
definitely wanted to take advantage of this.

The control panel again makes it trivial to create a container for your files.
Once the container has been created, you can use the web interface to upload
files, or use [Cyberduck][cyberduck].  I started by using the web interface, but
came to deeply regret it:

 1. It quickly saturated my upstream bandwidth, leading to significant spousal
    disapproval while I pushed up a couple GB of audio files.
 2. There's no progress bar, so I had to open and periodically refresh a second
    window to keep track of my progress.
 3. There's also no indicator of which file is being uploaded, so it's a good
    idea to only upload one at a time.

"Use Cyberduck" is much better advice, and it turned out to be a lot easier to
set up than I had expected.  I had expected "use Cyberduck" to link to a
knowledge center article about its use or configuration, and instead it just
links to the Cyberduck site.  Fortunately, Cyberduck is already hip to Rackspace
Cloud Files and just needs your username and API key.

I enabled logging (since I want to be able to count downloads of our episodes)
and time-to-live values very easily through the web interface, but I ran into a
couple of interesting gotchas with the CDN stuff.  First, the hints around
turning on logging suggest that your logs will go into a magical .ACCESS_LOGS
container that suddenly appears once you have some log data... and they do, but
those are the access logs from using the private file storage interface (through
the website and the API), *not* the logs from the CDN that represent the public
downloads of our files.  Those go into an even more magical .CDN_ACCESS_LOGS
container that appears sometime around 24 hours after you first start accessing
your files via the CDN.  Not huge, but kind of an expectation management goof.

The bigger issue that I ran into was that the MIME types of files are detected
when you first upload them, and there doesn't seem to be any way to change them.
In practical terms, this means that my .ogg audio files had gotten detected as
"audio/mpeg" and wouldn't play in HTML5 audio tags in Firefox on the Mac (which
wants them to be "audio/ogg").  The web interface and the API allow you to set
additional headers for metadata, but you can't edit the Content-Type at all.
Cyberduck *thinks* you can set a custom Content-Type, but it ends up coming out
of the CDN as a "X-Object-Meta-Content-Type" which is totally not useful.  I
briefly tried renaming files from .ogg to .oga in both Cyberduck and the web
interface in the hopes that changing the extension would cause the MIME type to
be re-detected; when that failed I was forced to reupload all of our ogg audio
with .oga extensions.  This is probably the single crappiest aspect of my
overall Rackspace experience; but now I know, and [knowing is half the
battle][halfthebattle].

##### DNS

Since we're trying to reduce the [bus factor][bus] involved in running FPIP, I
was really excited to take advantage of Rackspace's DNS capabilities.  They
offer both a web interface and API hooks in case you like to write custom
clients or need to manage DNS programmatically.  Like a good boy should, I tried
starting with documentation but found it pretty lacking--there's some *very*
high-level marketing fluff, and then the main documentation is about the API.
What I really wanted was somewhere in between, so that I'd know what I was
getting into and at what point in the process I would start creating unintended
consequences.

In the end, I just forged ahead and found that the actual experience of using
the web interface was much simpler than I expected.  My biggest concern was that
the first "create domain" would cause untold horrors to unfurl across the
universe of domain name servers turned out to be completely unfounded; it's just
a placeholder until you start adding records, and even then it won't matter
until you use your registrar's interface to use Rackspace's DNS servers for your
domain.  Once you've done the "create domain" step, adding and editing records
is pretty straightforward, and I was able to quickly duplicate our existing A,
CNAME, MX, and TXT records.

I like that the sidebar help links include information on [SPF][spf] and
[DKIM][dkim], though it wasn't really relevant to us (we're not exactly in the
business of email deliverability).  I also like that in the web interface, TTLs
can be specified in either seconds or minutes.

##### Sending Email

Speaking of sending email, I think it's kind of cool that Rackspace users get a
free [Mailgun][mailgun] account, which would make sending modest volumes of
email really easy and reliable.  My needs--the back end of a contact form that
mostly just gets spam in languages I can't read--didn't justify plugging into
Mailgun, so I just installed Postfix and got on with it.

##### Backups & Monitoring

Once you've got everything Just Right, it's super-easy to take a backup image of
your server that you can use to restore from or create new servers as you need.
This is pretty great as it allows you to quickly create additional servers from
the same mold if you need to scale things out horizontally.  You can even
automate the creation of images to back up servers regularly.

The web interface also makes it really easy to set up monitoring on your
servers, allowing you to be automatically notified if your site isn't up, or
you're running into load or diskspace problems, etc.  This comes at a small
incremental cost per check, but I appreciate the peace of mind.  Of course, we
aren't running hundreds of servers so your mileage may vary.

##### API

I've mentioned the API a few times now, so let's finally talk about it.
Rackspace provides a comprehensive API for manipulating their services.  As far
as I can tell, with the API you can do everything the web control panel can do
(and probably more).  If you like writing RESTful API client code, you can do
that; if not, Rackspace provides wrappers in a variety of languages.  Obviously,
I chose to mess with [Pyrax][pyrax], the Python implementation.

My goal was to write a script to pull down CDN logs so that I can continue to
track downloads of our shows.

After making a virtualenv and pip installing Pyrax, I set down to absorb the
documentation, only to find that the "getting started" link was incorrect.  I
notified folks at Rackspace and I expect this is already fixed or will be soon.
I obtained my API key (almost but not quite where the docs say to look, I
believe due to updates to the web interface).  I found further frustration in
the process of trying to authenticate and start using the API--the documentation
and examples are really unclear and confusing and need a serious rewrite to
clean them up for human-friendliness.  Here's [my little script][apiexample]
that hopefully clarifies the process of authenticating and connecting.  The high
points are:

 1. Set the identity type using pyrax.set_setting
 2. Plug into your credential file using pyrax.set_credential_file
 3. Authenticate using pyrax.authenticate
 4. Make a connection to a service--in my case, pyrax.connect_to_cloudfiles; be
    sure to include the region!

Other than the initial auth frustration, I found the API decently documented,
with responsibilities clearly separated, and overall straightforward and
pleasant enough to work with that I'll consider exploring it further.

##### Concluding Thoughts

Overall, my Rackspace experience has been quite positive, and I'd recommend
checking them out to see if it's a good fit for what you want to do.  I'd like
to sincerely thank Jesse and Rackspace for helping to breathe a little new life
into the podcast by giving us a chance to play with their toys.

There are some documentation issues that should be addressed--I know Rackspace
prides itself on its "fanatical support", but a DIYer like myself doesn't want
to have to contact support to sort out things that refreshed or improved
documentation would make trivial.  And I'd like to see just a little more
control in the Cloud Files stuff.

Now that we're all set up, I'm excited to be preparing some new episodes to be
released this fall.  Stay tuned!

[jnoller]: http://jessenoller.com
[accounts]: https://twitter.com/jessenoller/status/355757374906183680
[rackspace]: http://www.rackspace.com
[akamai]: http://www.akamai.com
[cyberduck]: http://cyberduck.ch
[halfthebattle]: http://s3.media.squarespace.com/production/465215/5432662/wp-content/uploads/2009/08/thebattle_zoom.png
[bus]: http://en.wikipedia.org/wiki/Bus_factor
[spf]: http://en.wikipedia.org/wiki/Sender_Policy_Framework
[dkim]: http://en.wikipedia.org/wiki/Dkim
[mailgun]: http://www.mailgun.com
[pyrax]: https://github.com/rackspace/pyrax
[apiexample]: https://github.com/fpip/stats/blob/master/download_logs.py
