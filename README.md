gloss-server
============

Gloss Server

### Todo List

#### Backend

- [ ] Site-side authentication (see Friendfeed-bookmarklet-iframe message passing)
- [ ] Set up pinging to prevent Heroku dyno idling
- [X] Add creation of unique usernames on registration

#### Frontend

- [ ] Enable debugging view on dev environment
- [X] Hide admin controls
- [X] Add pagination to highlights index page
- [ ] Provide bookmarklet saving to user
- [ ] Remove auth code in bookmarklet
- [ ] Provide staging / dev bookmarklet depending on environment

#### Bookmarklet

- [X] Save canonical url if available
- [ ] Do some checking of bad canonical urls (ex: http://www.insidehighered.com/blogs/library-babel-fish/throwing-books-each-other )
- [ ] Remove URL parameters (and otherwise clean up the URL (but keep #ids))
- [ ] Better representation of loading
- [ ] Clean surrounding text of newlines
- [ ] Solve problem with surrounding text slurping up entire article if paragraphs are broken by br tags.
- [ ] Add deleting of highlights on second click (initial save of highlights must return the highlight id)
- [ ] Load user's existing highlights

#### Design

- [ ] Identity
- [ ] Homepage
- [ ] Sign Up, Sign In pages
- [ ] User profile page
- [X] Highlight page
- [X] Stream page
- [ ] Town square page
