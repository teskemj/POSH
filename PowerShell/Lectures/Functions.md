# Powershell

## Working with Functions

### Truisms

_It is a truism that a script is never completed…there is always something else to add to a script-a change that will improve it or additional functionality that someone requests._

Ed Wilson-PowerShell: Step-by-Step

----

* How can we create simple "scripts" that are easy to use and portable?
* For instance, a commonly used command that needs to be flexible and reusable without re-typing the entire command:

```powershell

Get-WmiObject -Class win32_operatingsystem –ComputerName DC1 |
    Select-Object buildnumber,caption,servicepackmajorversion

```