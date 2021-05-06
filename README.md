# README

Library-api
 a test api for demonstrating pagination and scope usage in Rails

Things you may want to cover:

* Ruby version

* Deployment instructions

* LIBRARY API
1.Query all authors

[haruna]$ curl http://localhost:3000/api/v1/authors | json_pp

2.Query for a single author by id

[haruna]$ curl http://localhost:3000/api/v1/authors/id | json_pp

3.Search for an author using name/genre

[haruna]$ curl http://localhost:3000/api/v1/authors?name=firstname%20lastname | json_pp

[haruna]$ curl http://localhost:3000/api/v1/authors?genres=genres | json_pp

4.Query all books

[haruna]$ curl http://localhost:3000/api/v1/books | json_pp

5.Query a single book by id

[haruna]$ curl http://localhost:3000/api/v1/books/id | json_pp

6.Query for a book using a title

[haruna]$ curl http://localhost:3000/api/v1/books?title=title | json_pp

* Planned Improvements

Using a faster search engines like pg_search or ElasticSearch

Optimization of search queries

Implementation of API keys


