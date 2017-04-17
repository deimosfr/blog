---
title: 'Elasticsearch: How we speed up news feeds and user walls display'
author: Romaric Philogene
type: post
date: 2016-01-20T10:00:41+00:00
url: /2016/01/20/how-we-speed-up-news-feed-and-user-wall-display-using-elasticsearch/
thumbnailImage: /thumbnails/logo_elasticsearch.png
thumbnailImagePosition: left
rating:
  - 5
votes:
  - 1
categories:
  - Developement
  - Nousmotards
tags:
  - nousmotards

---

&nbsp;

In [my previous post](https://blog.deimos.fr/2016/01/15/how-we-use-neo4j-on-our-social-network-and-workaround-performance-issues/), I talked about how to speed up reads and writes coupling [Redis](http://redis.io/) with [Neo4J](http://neo4j.com/). Now I want to share with you how it's possible to [unload your server](https://en.wikipedia.org/wiki/Load_(computing)) and use [Elasticsearch](https://www.elastic.co/products/elasticsearch) to speed up news feed and user wall.

### 1/ Show me your news feed

A news feed is the main page of traditional social networks. Its main goal is to show you all recents updates from your friends and your interests. [Nousmotards](https://www.nousmotards.com) news feed is like any other social networks (facebook, linkedin..), the user's feeds are available from their web browser and their [NM mobile application](https://play.google.com/store/apps/details?id=com.nousmotards.android) and it looks like this.

![Screen-Shot-2016-01-20-at-00.11.36-535x1024](/images/Screen-Shot-2016-01-20-at-00.11.36-535x1024.png)

<p style="text-align: center;">
  The web feed above, the android feed below

![device-2016-01-20-003342-576x1024](/images/device-2016-01-20-003342-576x1024.png)

&nbsp;

As a user, you want to [get the more relevant things](https://en.wikipedia.org/wiki/EdgeRank)  and the most updated posts from your friends. And while you are scrolling you want to have the best experience possible. Which means, no glitch/freeze from the UI, no latency while loading images and bunch of news.

![more-to-less-relevant](/images/more-to-less-relevant.png)

### 2/ First attempt

In our first approach [we were using directly Neo4J](https://blog.deimos.fr/2016/01/15/how-we-use-neo4j-on-our-social-network-and-workaround-performance-issues/) to read data and display them to the users. Direct access to the database is expensive, 40 concurrent accesses and your server will become so slow than nobody will ever come back.

<p class="p1">
  <span class="s1">The datas to retrieve are unique to each user because it depends of what they liked, the people they are "friends" with, getting the last relevant things…  These are <strong>contextual datas</strong> to retrieve for each users.</span>

![Screen-Shot-2016-01-19-at-12.18.32-1024x714](/images/Screen-Shot-2016-01-19-at-12.18.32-1024x714.png)

I let you imagine the complexity of this, and the effort that the database has to do to respond to the 40 concurrent users, **enrich** them and serialize them all into [JSON](https://en.wikipedia.org/wiki/JSON) before sending them to the requester. (note: red dots are users)

Enrichment is the process of setting some properties depending on who made the request. For instance: Romaric has like a post from Pierre, Romaric request the server to have his feed page, he's retrieving the post that he liked in the same state. Pierre see that his post has been liked by Romaric.

&nbsp;

Enrichment processing is very expensive in time, and must be done for each document (10 documents per page) that you want to send to the requester.

![enrichments-1](/images/enrichments-1.png)

&nbsp;

4 requesters, 4 read queries in database, 40 enrichments which results to 40 read requests in database more.. server took at best 4 seconds to respond to each of them. Very bad for user experience.. More requesters you have, and more the service take time to respond.. latency ~= [O(n^2)](https://en.wikipedia.org/wiki/Big_O_notation) where n is the number of simultaneous requesters..

### 3/ Elasticsearch to the rescue

[Elasticsearch][1] is now a very popular documents store solution very used by [OPS][2] and developers. It's commonly used to store logs, search inside them, do sophisticated analytics.. Access times are very good and the product own large [community][3] to make it evolving into the right direction.

In Nousmotards we are using it for log analytics, monitoring and above all as **feeds and walls cache solution** !

Instead of directly using Neo4J to ship documents to the user, we have placed Elasticsearch between Neo4j and the "core app" to retrieve them, then enriching them from Redis before replying to the user_._

![1-1](/images/1-1.png)

&nbsp;

Neo4J disappear ? No it's just not used anymore on read requests. Now with 40 concurrent requests we are around 200 and 300ms to reply, that's huge difference ! Neo4J is no more bother by users who get their last updates and can process write requests smoothly. (stats from yesterday, 41245 req, 260ms average request time)

![Screen-Shot-2016-01-19-at-17.02.38-209x300](/images/Screen-Shot-2016-01-19-at-17.02.38-209x300.png)

### 4/ To conclude

Elasticsearch is our life saver, we are using it for more and more things at Nousmotards. In the other hand, it is not a database, you should not use it as your primary datastore ! Corrupt indices may happen and you should be able to reload all your data from scratch. If you know that, you can start to use it at its full potential and with no fear to break things 😉

&nbsp;

sources:

  * [News feed with Elasticsearch @Viadeo](http://kuhess.github.io/presentations/a-news-feed-with-elasticsearch/index.html#/)
  * [Activity Stream](http://activitystrea.ms/)
  * [News feed performance on iOS @Facebook](https://code.facebook.com/posts/340384146140520/making-news-feed-nearly-50-faster-on-ios/)
  * [News feed performance on Android @Facebook](https://code.facebook.com/posts/879498888759525/fast-rendering-news-feed-on-android/)

To get more informations on nousmotards: [blog.nousmotards.com](http://blog.nousmotards.com)

Join us ! :-)

![nm-app-all-screenshots-1024x292](/images/nm-app-all-screenshots-1024x292.png)

 [1]: https://en.wikipedia.org/wiki/Elasticsearch
 [2]: https://en.wikipedia.org/wiki/DevOps
 [3]: https://www.elastic.co/community
