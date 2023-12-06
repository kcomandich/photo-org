
photo organizer
======================

About
-----

Given a string representing a list of photos, with each photo represented as:
`"<photoname>.<extension>, <city_name>, yyyy-mm-dd, hh:mm:ss"`, returns a list of the new
names of all photos (the order of photos stays the same).

The new name of each photo contains the name of its city, numbered within the city based on date.
Numbers are padded with zeros so that filenames for photos from the same city all have the same
length. The file extension is preserved.


Requirements
------------

Tested with Ruby 3.2.2. Should work with Ruby 3.0+.


Use
---

```
ruby photo-org.rb
```


Tests
----------

Install bundler to get the dependencies:

```
gem install bundler
bundle install
```

To run the tests:

```
rspec
```


Author
------

Kirsten Comandich <kcomandich@gmail.com>



Copyright
---------

Copyright (c) 2023 by Kirsten Comandich

