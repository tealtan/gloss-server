gloss-server
============

Gloss Server

### Todo List

#### Backend

- [ ] Bookmarklet authentication posting (should only be able to modify your own highlights)
- [ ] Set up pinging to prevent Heroku dyno idling
- [X] Add creation of unique usernames on registration

#### Frontend

- [ ] Enable debugging view on dev environment
- [ ] Provide bookmarklet saving to user
- [ ] Provide staging / dev bookmarklet depending on environment

#### Bookmarklet

- [x] Save canonical url if available
- [ ] Do some checking of bad canonical urls (ex: http://www.insidehighered.com/blogs/library-babel-fish/throwing-books-each-other )
- [ ] Figure out better representation of loading.
- [ ] Clean surrounding text of newlines
- [ ] Solve problem with surrounding text slurping up entire article if paragraphs are broken by <br>s.
- [ ] Add deleting of highlights on second click

#### Design

- [ ] Homepage
- [ ] Sign up and Sign In pages
- [ ] User profile page
- [ ] Highlight page
- [ ] Stream / town square page
