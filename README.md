[![Dependency Status](https://gemnasium.com/rietta/handbag.png)](https://gemnasium.com/rietta/handbag)
[![Code Climate](https://codeclimate.com/github/rietta/handbag.png)](https://codeclimate.com/github/rietta/handbag)

# Handbag

## NOTICE: As of December 4, 2013, This is pre-release software that is available as open source.

## User has_many :possessions, through: purse

Handbag is a Ruby implementation of the Purse pattern, which is intended to enable robust implementations of anonymous user and access control that is decoupled from user accounts.

## The Purse Pattern
### What is  a Purse?
A Purse is a collection of Possessions. It may or may not have a Purse Holder.  It can be transferred from one Purse Holder to a new one in a single O(1) database transaction.

In other words, it makes anonymous user stories easy to implement!

### Why?
- With a Purse, a Purse Holder can own many things in a system
- The Purse can be transferred to another Purse Holder
- A Purse can start out belonging to no user at all (an Anonymous purse) and then later be transferred to a User
- A User can be destroyed and leave its anonymous possessions behind

### Anonymous Purses
A *Purse* that does not belong to a *Purse Holder* is called an *Anonymous Purse*. It can own possessions in the system like a user would own possessions. It is identified by a random [UUID](https://en.wikipedia.org/wiki/Universally_unique_identifier) and is particular browser session through an encrypted cookie.

### Every Visitor has a Purse
By using the Purse pattern, you ensure that every visitor has a *Purse*. A registered *User* with an account always has the same *Purse*. A visitor with an active *Anonymous Purse* will have the same one until the cookie is cleared or expires and a new *Visitor* will be automatically given an *Anonymous Purse*.  

## Using the Handbag
### Installation

`Write this.`

### In Your User Classes

```ruby
has_one :purse, :class => "Handbag::Purse", :as => :purseholder, :dependent => :destroy, :autosave => true
```

### 

# Testing the Engine

This article on [Rails Engine Testing with RSpec, Capybara, and FactoryGirl](http://viget.com/extend/rails-engine-testing-with-rspec-capybara-and-factorygirl) was helpful.

## License
Copyright 2013 Rietta Inc.

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
