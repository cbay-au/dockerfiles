# Hakrawler

Fast golang web crawler for gathering URLs and JavaScript file locations. This is basically a simple implementation of the awesome Gocolly library.

## Example usages

Single URL:

```
echo https://google.com | hakrawler
```

Multiple URLs:

```
cat urls.txt | hakrawler
```

Timeout for each line of stdin after 5 seconds:

```
cat urls.txt | hakrawler -timeout 5
```

Send all requests through a proxy:

```
cat urls.txt | hakrawler -proxy http://localhost:8080
```

Include subdomains:

```
echo https://google.com | hakrawler -subs
```

> Note: a common issue is that the tool returns no URLs. This usually happens when a domain is specified (https://example.com), but it redirects to a subdomain (https://www.example.com). The subdomain is not included in the scope, so the no URLs are printed. In order to overcome this, either specify the final URL in the redirect chain or use the `-subs` option to include subdomains.

## Example tool chain

Get all subdomains of google, find the ones that respond to http(s), crawl them all.

```
echo google.com | haktrails subdomains | httpx | hakrawler
```
