# Summit 2018 Keynote

## ITWorks-Techimpact

* Emotional intelligence (huge)
* VMWare Code
* April 29-May 2 PowerShell 2019

## Snover

[Jeffrey Moore](findthedumburl)

* Create bandwidth
    * Saas
    * Lift and Shift->move VMs to the cloud (better functionality)
    * Automate!
* Invest in innovation
    * Use cloud architectures (Paas)
    * Embrace devops->go faster by doing smaller batches...stop bring an asshole!!
    * Automate
    * Excellence at automation means winning
* PowerShell v6

## Bruce Payette

* The History of PowerShell

## Lightning demos

* Remote debugging (nothotdog)
* Azure modules ported to core soon
* Open-FileEditor
* JEA for Microsoft Security Fundamentals
    * Project Honalulu
* AzureRM module
    * Azure.automation
* PowerShell DSC
    * No charge for State Configuration
* Find Markdown cmdlets in Docs

## Session 1-Be The Master

## Session 2-DSC versus the "Others"

* DCS is tool, not a platform
* Declarative configuration management using PowerShell

## OpenSSH

* Authentication is primary issue

```bash
ps --forest -x -p $(pidof sshd)
```

[Centinosystems](www.centinosystems.com/blog)

* Something you have (key) and something you know (password)

## To Do

* Paar Git
* OpenGraph
* Graph DB
```PowerShell
   $p = get-process
   $p.where({$_.name -like "power*"})
```
## Lightning Demos

* Jupyter - documenting notes, code etc
* Invoke-redpen
* DBATools

## DSC Day 3 Jeff Hicks

* Ensure all nodes are at the same level
* Start with PowerShell commands and functions
* Scripted parameters will become resource settings
* Every DSC resource needs to have 1 property enabled

## Getting started with JEA

* 2 config files on your machine
    * session configuration file
        * defines __who__ and __how__ they can use the endpoint
    * Role capability file
        * what user can do

## Speed and PowerShell Josh King

* Runbucket
* PowerShell Universal dashboard
* Where "object" method came with PowerShell 4.0
* rsjob v start-job. start-job runs a separate posh process
* stop-watch function
* Hash table array types
* Pluralsight introduction to c# collection types

** VMWare
```powershell
open-vmconsolewindow -vm
```
## Implementing JEA in your Environment
@psjamesp

* needs wmf 5.1
* JEA helper 2.0

## CSV JSON XML

* Data type is the concern
* Everything is treated as a string when pulling from csv
* you lose type when you export to a csv
* Check out Jeffs database project on git under myTickle

## Summit takeaways

* Everyone needs to be on github
* Splatting and hash tables are common
* JEA needs to be done now
* Design your code so if you were to walk away from it for 6 months, you could sit down and understand why you wrote it the way you did.

## Managing your GIT

* vsts 5 licenses for free.
* poshgit
* Control R invokes searchable history via psreadline

## Homework

* .gitignore
* JEA
* expand Git bits
* VSTS with students
* Deploy-Course project
* Pluralsight introduction to c# collection types
* Convertto-VHD
* VSTS Adam Murray
* set-psreadline

## Management tools

* Trello
* Course building/vlogging on pluralsight
* Ross Bagurdis
* Figure the flow, pauses, cuts, etc.
* ASM Author Success Manager
* Transcription...record audio and video and then review
