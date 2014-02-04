gloss-server
============

Gloss Server

### Todo List

#### Backend

- [X] Basic authentication
- [X] Better pagination of highlights
- [ ] Set up pinging to prevent Heroku dyno idling
- [ ] Rework highlight pages to include username?
- [X] Add creation of unique usernames on registration

#### Frontend

- [X] Proper form styling for Sign In / Register pages
- [X] Enable debugging view on dev environment
- [X] Hide admin controls
- [X] Add pagination to highlights index page
- [X] Provide bookmarklet saving to user
- [X] Provide staging / dev bookmarklet depending on environment
- [ ] Responsify!

#### Bookmarklet

- [X] Save canonical url if available
- [X] Do some checking of bad canonical urls (ex: http://www.insidehighered.com/blogs/library-babel-fish/throwing-books-each-other )
- [ ] Better representation of loading
- [ ] Clean surrounding text of newlines
- [ ] Skip over images
- [ ] Solve problem with surrounding text slurping up entire article if paragraphs are broken by br tags.
- [ ] Add deleting of highlights on second click (initial save of highlights must return the highlight id)
- [ ] Load user's existing highlights

#### Design

- [X] Identity
- [X] Homepage
- [X] Register, Sign In pages
- [ ] User profile page
- [X] Highlight page
- [X] Stream page
- [ ] Town square page
