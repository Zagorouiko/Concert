Venue
==============
May 15th, 2015
Leon Zagorouiko

About:
===============
The site is able to add and delete venues and also add bands to those venues. Bands can be updated or deleted, and can also be listed.

Heroku link:
===============


Installation
===============
Retrieve the included Gemfile and Run the following command: -bundle install. Run rake create database and migration,then  create the following tables:

create_table "bands", force: :cascade do |t|
  t.string   "name"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false

create_table "bands_venues", force: :cascade do |t|
  t.integer "band_id"
  t.integer "venue_id"

create_table "venues", force: :cascade do |t|
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.string   "name"

Usage
===============
Run app.rb

Bug Reports
==============
if you discover any bugs, feel free to create an issue on GitHub. Please add as much information as possible to help us fixing the possible bug. We also encourage you to help even more by forking and sending us a pull request.

User has a personalized dictionary where they can add multiple words to a page and for every word they can add multiple definitions.

Ruby 2.2.0p0 (2014-12-25 revision 49005) [x86_64-darwin14] The MIT License (MIT)

Copyright (c) 2015

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
