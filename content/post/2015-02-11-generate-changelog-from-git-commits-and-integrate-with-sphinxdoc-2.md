---
title: Generate changelog from git commits and integrate with Sphinxdoc
author: Deimos
type: post
date: 2015-02-11T11:00:22+00:00
url: /2015/02/11/generate-changelog-from-git-commits-and-integrate-with-sphinxdoc-2/
image: /images/logo_git.png
thumbnailImage: /thumbnails/logo_git.png
thumbnailImagePosition: left
categories:
  - Debian
  - Developement
  - Git
  - Hi-Tech
  - Linux
  - Red Hat
tags:
  - Debian
  - Developement
  - Git
  - Hi-Tech
  - Linux
  - Red Hat

---
![Git-logo](/images/logo_git.png)
For another personal project (that I can't talk about for the moment ;-)), I wanted to have a Changelog file to get a better following of the infrastructure evolution (configuration management, scripts...all under git). Of course the documentation is very important, but when you do not write it at the same time you're building the infrastructure, it may be complex to remember each little things you've done. That's why a Changelog can help to understand how the infrastructure has been built step by step.

I'm going to show you how I achieved it. This is not a generic system, but brings you the keys to adapt for your needs.

## The goal

That's why I wanted to have a Changelog up to date. But...have you ever tried to maintain by hand a Changelog? I pretty sure yes and you know this is boring! That's why I wanted something automatic. More than that, I wanted to have direct links to my ticketing system on hashtags detection.
  
A few weeks ago, I watched [a video on a Meetup about how to level up with git](http://www.infoq.com/fr/presentations/git-niveau-superieur-gestion-version) (one of the best practices and why). After adopting and adapting a bit this, I decided to have commits comments format like that:

{{< highlight bash >}}
##
## Format
##
##   ACTION(TOPIC): COMMIT_MSG #TICKET_NUM [!TAG ...]
##
## Description
##
##   ACTION is one of 'feat', 'fix', 'refactor', 'chore', 'test', 'style', 'docs'
##
##       Is WHAT the change is about.
##
##       'feat' is for new features, big improvement
##       'fix' is for bug fixes
##       'refactor' is for code refactoring, without any visual user change
##       'chore' is for any else but the app
##       'test' is for any kind of tests (functionnal, unitary...)
##       'style' is for cosmetic changes (spaces vs tab...)
##       'docs' is for documentation
##
##   TOPIC is optional and to specify the part on the app you're working on
##
##       Is WHO is concerned by the change.
##
##       'dev'  is for developpers (API changes, refactors...)
##       'usr'  is for final users (UI changes)
##       'pkg'  is for packagers   (packaging changes)
##       'test' is for testers     (test only related changes)
##
##   COMMIT_MSG is ... well ... the commit message itself.
##
##   #TICKET_NUM is the ticket number associated
##
##      If you don't want to specify a ticket number, use:
##
##      '#noticket' or
##      '#nt'
##
##   TAGs are additionnal adjective as 'refactor' 'minor' 'cosmetic'
##
##       They are preceded with a '!' or a '@' (prefer the former, as the
##       latter is wrongly interpreted in github.) Commonly used tags are:
##
##       'refactor' is obviously for refactoring code only
##       'minor' is for a very meaningless change (a typo, adding a comment)
##       'cosmetic' is for cosmetic driven change (re-indentation, 80-col...)
##       'wip' is for partial functionality but complete subfunctionality.
##
## Example:
##
##   feat(ansible): adding configuration with common roles #INF-4
##   fix(docker): disabling systemd and installing sysvinit #noticket
##   docs(): removing unwanted files on the doc #noticket
##
##   Please note that multi-line commit message are supported, and only the
##   first line will be considered as the "summary" of the commit message. So
##   tags, and other rules only applies to the summary.  The body of the commit
##   message will be displayed in the changelog without reformatting.
{{< /highlight >}}

With this kind of comments, I was able to generate something to help me to build the Changelog. In the same video, they were talking about a custom Ruby script which cloud do the job. However a big part of my tools and infrastructure are written in Python and wanted to have a maintained tool in Python to do it.

## The tool

After a little bit of research, I've found [gitchangelog](https://pypi.python.org/pypi/gitchangelog) tool. This is a light Python script installable via pip which will generate a markdown file from git logs. That was exactly what I was searching for. But as you know, it doesn't work out of the box because I already have decided of the format I wanted.

So I adapted the configuration (.gitchangelog.rc) to make it work with the wished log format. The configuration looks like this:

{{< highlight python >}}
# Ignore comments
ignore_regexps = [
        r'@minor', r'!minor',
        r'@cosmetic', r'!cosmetic',
        r'@refactor', r'!refactor',
        r'@wip', r'!wip',
        r'^(.{3,3}\s*:)?\s*[fF]irst commit.?\s*$',
  ]
# Detect sections
section_regexps = [
    ('New features', [
    r'^[fF]eat(\(.*\)?):.+([^\n]*)$',
     ]),
    ('Fix', [
    r'^[Ff]ix(\(\w*\)?):.+([^\n]*)$',
     ]),
    ('Refactor', [
    r'^[Rr]efactor(\(\w*\)?):.+([^\n]*)$',
     ]),
    ('Documentation', [
    r'^[Dd]ocs?(\(\w*\)?):.+([^\n]*)$',
     ]),
    ('Other', None ## Match all lines
     ),
]
# Rewrite body
body_process = (ReSub(r'.*', '') |
                ReSub(r'^(\n|\r)$', ''))
# Rewrite subject
subject_process = (strip |
    ReSub(r'^(\w+)(\((.*)\):\s?([^\n@]*))(@[a-z]+\s+)*$', r'*\3*: \4') |
    ReSub(r'^\*\*: ', '') |
    ReSub(r'#INF-(\d+)', r'(`#INF-\1 &lt;https://ticketingserver/INF-\1&gt;`_)') |
    ReSub(r'\) \(', ' ') |
    ReSub(r' (#noticket|#nt)', '') |
    strip | ucfirst | final_dot)
# Detect tags
tag_filter_regexp = r'^v[0-9]+\.[0-9]+(\.[0-9]+)?$'
unreleased_version_label = "Next version (unreleased yet)"
# Generate markdown
output_engine = rest_py
include_merges = True
{{< /highlight >}}

As you can see, it's only regex. You can read the full commented lines in the configuration file (shrinked here) for a better understanding of what you can do. Subject is separated from the body, they both have their own regex and a link to the ticketing system is automatically generated with '#INF-' prefix. I do not wanted the body information appearing in the Changelog, so I substituted the content with nothing.

I was now able to generate markdown by using gitchangelog command. There, I achieved the first step.

## Integration with sphinxdoc

To make it better, I wanted to have an integration with Sphinxdoc as I'm using it for the project. I updated so the Makefile to generate the changelog before making the documentation like that:

{{< highlight python >}}
# CHANGELOGFILE = changelog.rst
GENCHANGELOG  = $(GITCHLOGBIN) &gt; source/$(CHANGELOGFILE) || exit 1
...
html:
    $(GENCHANGELOG)
    $(SPHINXBUILD) -b html $(ALLSPHINXOPTS) $(BUILDDIR)/html
    @echo
    @echo "Build finished. The HTML pages are in $(BUILDDIR)/html."
{{< /highlight >}}

## The result

The result looks like this:

![sphinx_changelog-1024x585](/images/sphinx_changelog-1024x585.png)

Cool isn't it? No more manual Changelog to do and it's nicely integrated in Sphinxdoc :-)

## Avoid mistakes with hook

To get a good Changelog without issues, I also needed to have a hook on the server side to check and validate the subject. The git server I'm using for the project is Stash and I'm using an already existing hook to do the job. This is not perfect but it works with this regex:

{{< highlight perl >}}
(feat|fix|refactor|chore|test|style|docs)\(.*\):.*#(INF-\d+|noticket|nt)
{{< /highlight >}}

You may need to develop a custom hook on other git server.

Hope you've enjoyed reading
