# Handbag
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
