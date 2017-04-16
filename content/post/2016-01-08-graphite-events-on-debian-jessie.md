---
title: Graphite events on Debian jessie
author: Deimos
type: post
date: 2016-01-08T11:00:28+00:00
url: /2016/01/08/graphite-events-on-debian-jessie/
categories:
  - graphite
  - Hi-Tech
  - Nousmotards
tags:
  - nousmotards

---

I'm using Graphite at work and for my [Nousmotards](http://www.nousmotards.com) project. For Nousmotards, I'm using the Graphite version available in the default Debian Jessie repositories. This to avoid mismatch django dependencies etc...

A few days ago, I wanted to try Graphite events to get [something pretty cool in Grafana](http://docs.grafana.org/reference/annotations/) :
  
![grafana_annotations-1024x278](/images/grafana_annotations-1024x278.png)

This to be able to know when a new app version is deployed and make it easier to understand when an issue occurs. However I had troubles with curl command when I wanted to
  
send data, because there is a mismatch dependencies between the Django version and Graphite version in Debian Jessie:

{{< highlight bash >}}
Traceback (most recent call last):
  File &quot;/usr/lib/python2.6/site-packages/django/core/handlers/base.py&quot;, line 114, in get_response
    response = wrapped_callback(request, *callback_args, **callback_kwargs)
  File &quot;/opt/graphite/webapp/graphite/events/views.py&quot;, line 32, in view_events
    return post_event(request)
  File &quot;/opt/graphite/webapp/graphite/events/views.py&quot;, line 44, in post_event
    event = json.loads(request.raw_post_data)
AttributeError: 'WSGIRequest' object has no attribute 'raw_post_data'
{{< /highlight >}}

I've found several solution proposing Django upgrade etc... but the simplest solution I've found for me is to simply make a replacement directly in a graphite lib. Edit the file /usr/lib/python2.7/dist-packages/graphite/events/views.py and update the event line like this:

{{< highlight python >}}
def post_event(request):
    if request.method == 'POST':
        #event = json.loads(request.raw_post_data)
        event = json.loads(request.body)
        assert isinstance(event, dict)
{{< /highlight >}}

Then restart uwsgi service and finally it works like a charm :-)
