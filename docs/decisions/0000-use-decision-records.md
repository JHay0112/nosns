# 0000: Use Decision Records

## Decision
This project shall use decision records stored in `docs/decisions` to document
the design decisions made during its development. Decision records shall be made
in markdown and follow a "Context", "Decision", "Rationale" structure.

Once accepted, a decision record is enumerated with a numeric code. Future
decision records may reference past decision records with their numeric code,
though direct links are preferred.

Decision records that change or impact the decisions made in a past decision
record are expected to explicitly reference the decision records that they
impact. The original decision record should also be modified to reference the
decision record that supersedes it at the top of the document.

## Rationale
The project management method of writing decision records was popularised by
[Michael Nygard's publication on "Documenting Architecture Decisions"](https://cognitect.com/blog/2011/11/15/documenting-architecture-decisions).
The experience of Nygard and other engineers is that decision records are useful
for capturing long-term intentions about the project under development.

The intent of using decision records in this project is to encourage a
consistent long-term direction as Nygard suggests. I also believe that
formalising my decision making will help me to justify my decisions in lieu of
collaborators who would provide the productive friction I find is useful to
develop a well considered solution.
