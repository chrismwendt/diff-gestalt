# diff-gestalt

diff-gestalt is a diff algorithm based on recursive longest common substrings.

A description of the algorithm itself can be found [here](http://collaboration.cmc.ec.gc.ca/science/rpn/biblio/ddj/Website/articles/DDJ/1988/8807/8807c/8807c.htm).

## diff-gestalt vs Diff

diff-gestalt tends to produce smaller diffs than the [Myers algorithm](http://citeseerx.ist.psu.edu/viewdoc/summary?doi=10.1.1.4.6927) used in the [Diff package](https://hackage.haskell.org/package/Diff).

```haskell
>>> diff "tree" "there" -- diff-gestalt (4 diffs)
[Both "t" "t",Second "he",Both "re" "re",First "e"]
>>> getGroupedDiff "tree" "there" -- Diff (6 diffs)
[Both "t" "t",First "r",Second "h",Both "e" "e",Second "r",Both "e" "e"]
```
