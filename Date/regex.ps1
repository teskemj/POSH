cat matches cat
ca+t matches caaaaaaaaaaaat but not ct
cat matches caaaaaaaaaaaat and also ct
ca { 2, 4 } matches caat, caaat and caaaat
c(at.exe)+ matches catatatatatat
c(at.exe | orn) matches cat and corn
c[ea] matches cat and cet
c[ea]+ matches caaaat and ceeet



c[A-C0-9] matches cAt, cBt, cCt, c8t etc.
c.t matches cat, c&t, c2t (any char between c and t)
c.+t matches c3%x4t (any number of any chars)
c.*t matches c3%x4t and as well as ct
^ denotes start of a string, $ denotes the end
^a+cat will match aaacat in aaacat but not in bbaaacat

cat$ will match cat in aaacat but not in aaacats
^cat$ will match only and only this string i.e. cat

\d is for digits, \w for alphanumeric chars, \s is for white space chars & line breaks
\D is for non-digits, \W for non-alphamueric chars and \s is for non-white space chars

\t for tabs, \r for carriage return and \n for newline

Yes, c\d+t matches c2784t
Yes, c\s+ matches c       t
Yes, c\D+ matches cxxxt ca2t 

Using .*w vs .*?w on xxsomethingnew@1234wxx
.*w returns somethingnew@1234w (longest match)
.*w? returns somethingnew (shortest match)

> c[ea]t matches cat and cet
> c[ea]+t matches caaat, ceeet (also caeeeaaeat)
> c[A-C0-9]t matches cAt, cBt, cCt, c8t etc.
> .*w and .*w? will match "xx" in the starting of xxsomethingnew.... as well

grouping
() are capturing groups. (ca+t)(dog) will match caaatdog.
Groups can be accessed in Python as follows:
http://match.group(0) = caaatdog
http://match.group(1) = caaat
http://match.group(2) = dog

(ca+t)dog\1 matches caaaatdogcaaaat where \1 is obviously the second (arrays start with 0) group

If you don't want to capture a group add ?: in the start e.g. (?:ca+t)dog

Look-aheads and Look-behinds

cat(?=dog) matches cat in catdog not in catxyz
cat(?!dog) matches cat in catxyz not in catdog
(?<=cat)dog matches dog in catdog not in xyzdog
(?<!cat)dog matches dog in xyzdog not in catdog
