
# TO DO
	1. sort out the volume path so my .env file is accessable to the container

===================================================================

# This Dockerfile is a collection of the repos crafted by hakluke https://github.com/hakluke?tab=repositories

Build the image using;
```
cd /dockerfile/hakluke
docker build -t hakluke .
```
Run using:
```
docker run -v /home/leigh/.env:/home/.env -it --name hakluke hakluke bash
```

===================================================================

# The following repo's are included

## Hakrawler	https://github.com/hakluke/hakrawler/blob/master/README.md

Fast golang web crawler for gathering URLs and JavaScript file locations. This is basically a simple implementation of the awesome Gocolly library.

## Hakrevdns	https://github.com/hakluke/hakrevdns/blob/master/README.md

Small, fast, simple tool for performing reverse DNS lookups en masse.

You feed it IP addresses, it returns hostnames.

This can be a useful way of finding domains and subdomains belonging to a company from their IP addresses.

## Haklistgen	https://github.com/hakluke/haklistgen/blob/main/README.md

Turns any junk text into a usable wordlist for brute-forcing.

## Hakoriginfinder	https://github.com/hakluke/hakoriginfinder/blob/main/README.md

Tool for discovering the origin host behind a reverse proxy. Useful for bypassing WAFs and other reverse proxies.

## hakcheckurl	https://github.com/hakluke/hakcheckurl/blob/master/README.md

Takes a list of URLs and returns their HTTP response codes. This tool is perfect for quickly determining the status of multiple web pages, especially when combined with other tools.

This tool was written to be chained with hakrawler to easily check the response codes of discovered URLs.

## Haktrails	https://github.com/hakluke/haktrails/blob/main/README.md

haktrails is a Golang client for querying SecurityTrails API data

Need API key

## Haktldextract	https://github.com/hakluke/haktldextract/blob/master/README.md

Basic tool to extract domains/subdomains from URLs en masse

## hakip2host	https://github.com/hakluke/hakip2host/blob/main/README.md

hakip2host takes a list of IP addresses via stdin, then does a series of checks to return associated domain names.


