# nosns

nosns is a no-nonsense note taking application. Its primary goal is to make
note taking simple and to let the user to think about nothing other than
writing and structuring their notes.

nosns is designed around my opinions on what is nice and easy to use. If
that doesn't work for you, that is fine, this application is not meant to
be for everyone. If it helps you to get into my head as to what software
I think is "nice and easy to use", I consider emacs in evil mode my ideal
text editor but I don't enjoy org-mode (weird!).

With all that said and done, what ~~does~~ do I plan for nosns to do:

 1. Automatically format (and reformat) markdown-like notes within a
    repository.
 2. Use an 80 character limit when formatting.
 3. Use vim-like keyboard commands to create and navigate notes.
 4. Support arrow keys for navigation for people who don't like vim.
 5. Have an emacs-like bottom bar for giving contextual information
    and hints.
 6. Open to a blank page from which you can create a new note or navigate
    through the current repository.
 7. Automatically place new notes into a backlog directory with date
    driven titles.
 8. View the backlog and organise into hierarchical topics (directories)
 9. Tie into a version control system

nosns uses Zig as its primary programming language. Check `build.zig.zon` for
the version used in development.

I also have some useful git hooks for automatically formatting the source files.
These can be manually installed, or automatically installed and validated with
the `setup.sh` and `validate.sh` scripts in `scripts/devenv`.
