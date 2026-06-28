# 0001: Split UI and Repository Management Code

## Decision
The user interface and repository managment code of nosns shall be seperated
into independent Zig modules.

## Rationale
Seperation of the repository management module from the user interface allows
the user interface to be changed out without refactoring of the core
application. The structure of Zig modules will also allow the development of
other applications that depend directly upon the repository managment code.
