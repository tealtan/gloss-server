gloss-server
============

Gloss Server

### Todo List

#### Backend

- [X] Basic authentication
- [ ] Better pagination of highlights
- [ ] Set up pinging to prevent Heroku dyno idling
- [X] Add creation of unique usernames on registration

#### Frontend

- [ ] Enable debugging view on dev environment
- [X] Hide admin controls
- [X] Add pagination to highlights index page
- [X] Provide bookmarklet saving to user
- [X] Provide staging / dev bookmarklet depending on environment

#### Bookmarklet

- [X] Save canonical url if available
- [X] Do some checking of bad canonical urls (ex: http://www.insidehighered.com/blogs/library-babel-fish/throwing-books-each-other )
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