---
title: Logstash vs Fluentd
author: Deimos
type: post
date: 2014-05-13T10:00:10+00:00
url: /2014/05/13/logstash-vs-fluentd/
image: /images/logo_logstash.png
thumbnailImage: /thumbnails/logo_logstash.png
thumbnailImagePosition: left
rating:
  - 4.75
votes:
  - 4
categories:
  - Databases
  - Hi-Tech
  - Linux
tags:
  - Databases
  - Hi-Tech
  - Linux

---
![logstash](/images/logo_logstash.png)
Regarding [one of my latest post](http://blog.deimos.fr/?p=4650), talking about Fluentd, some of you asked me why I've chosen Fluentd instead of Logstash. First of all, I've looked at [this blog post](http://jasonwilder.com/blog/2013/11/19/fluentd-vs-logstash/), which kindly resume the current situation. Looking at this and with feedback I got, I could establish this array:

<table dir="ltr" style="table-layout: fixed; font-size: 13px; font-family: arial,sans,sans-serif; border-collapse: collapse; border: 1px solid #cccccc; height: 259px;" border="1" width="470" cellspacing="0" cellpadding="0">
  <colgroup> <col width="106" /> <col width="150" /> <col width="192" /></colgroup> <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom;">
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #c9daf8; font-weight: bold; text-align: center;" data-sheets-value="[null,2,&quot;Logstash&quot;]">
      Logstash
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #c9daf8; font-weight: bold; text-align: center;" data-sheets-value="[null,2,&quot;Fluentd&quot;]">
      Fluentd
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Concerns&quot;]">
      Concerns
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; text-align: center;" data-sheets-value="[null,2,&quot;Flexibility/Interoperability&quot;]">
      Flexibility/Interoperability
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; text-align: center;" data-sheets-value="[null,2,&quot;Simplicity/Robustness&quot;]">
      Simplicity/Robustness
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Language&quot;]">
      Language
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; text-align: center;" data-sheets-value="[null,2,&quot;JRuby&quot;]">
      JRuby
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; text-align: center;" data-sheets-value="[null,2,&quot;Cruby&quot;]">
      Cruby
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Inputs&quot;]">
      Inputs
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;More&quot;]">
      More
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #f4cccc; text-align: center;" data-sheets-value="[null,2,&quot;Fewer&quot;]">
      Fewer
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Inputs specs&quot;]">
      Inputs specs
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #f4cccc; text-align: center;" data-sheets-value="[null,2,&quot;Basics&quot;]">
      Basics
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;Scalables&quot;]">
      Scalables
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Plugins&quot;]">
      Plugins
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #f4cccc; text-align: center;" data-sheets-value="[null,2,&quot;Lot&quot;]">
      Lot
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;Lot more&quot;]">
      Lot more
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Plugins install&quot;]">
      Plugins install
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;Simple (drop a jar)&quot;]">
      Simple (drop a jar)
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; text-align: center;" data-sheets-value="[null,2,&quot;Can be complex (dependancies)&quot;]">
      Can be complex (dependencies)
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Logs send crypt&quot;]">
      Logs send crypt
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;Yes&quot;]">
      Yes
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;Yes&quot;]">
      Yes
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Scalability&quot;]">
      Scalability
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #f4cccc; text-align: center;" data-sheets-value="[null,2,&quot;Forward to 2 hosts&quot;]">
      Forward to 2 hosts
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;LB A/A or A/P&quot;]">
      LB A/A or A/P
    </td>
  </tr>
  
  <tr style="height: 21px;">
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #fff2cc; font-weight: bold;" data-sheets-value="[null,2,&quot;Reliability&quot;]">
      Reliability
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #f4cccc; text-align: center;" data-sheets-value="[null,2,&quot;Can loss messages&quot;]">
      Can loss messages
    </td>
    
    <td style="padding: 2px 3px 2px 3px; vertical-align: bottom; background-color: #d9ead3; text-align: center;" data-sheets-value="[null,2,&quot;No message loss&quot;]">
      No message loss
    </td>
  </tr>
</table>

[Logstash](http://logstash.net/) and Fluentd are both powerful solutions, they both got pros and cons. Even if Logstash is an incredible solution, it looks like not the best solution today for production usage for several reasons (maturity, code changing...). That's why I chose Fluentd.

Since [Jordan Sissel](https://twitter.com/jordansissel) (Logstash creator) joined Elasticsearch company, I'm pretty sure integration and stability will be improved. I'm still keeping an eye on it :-)