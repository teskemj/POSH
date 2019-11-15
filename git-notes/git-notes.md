# Gitting Started With Git
## Thomas Rayner
* Collaboration  is the big reason to use git


* [Thomas Rayner Git Post](https://thomasrayner.ca/first-git-commands)
* [Github Desktop](https://desktop.github.com)
* Pluralsight course Getting started with Git
* Pluralsight course Mastering Git
* Gitlab CE
* Github Learning Lab
* [Git Koans](http://stevelosh.com/blog/2013/04/git-koans/)
* [WriteCodeCatFacts](https://github.com/writecodepetcats/catfacts) This was demo git
* To get your own copy to edit (fork) 
  * Fork the repo to fork it
    * Fork to your account...click fork button
    * Fork is a copy of someone else repo to edit and have control over
    * Clone to bring down to your computer
    * conemu con emulator [https://conemu.github.io/](https://conemu.github.io/)
  * Branch is a copy of data to work on code w/out impacting the code
    * Make changes without impacting the master
  * git checkout -b fix-it
    * checkout is used switch between branches
    * -b creates new branch
    * git branch 'name'
    * git checkout 'name'
    * code -r . (opens vscode in the current working directory)
  * git status (in the repo) shows the files that haven't been staged or ready to send to github

  ``` git
  git add -A 
  # adds/stages (not sending) all diff changes that aren't changed)
  ```

  ``` git 
  git add filename.ps1
  ```
  * Next you create the commit you are sending to github.
    * A commit is a package or summary of the changes
    * Bundle and send to GH
  
  ``` git
  git commit -m "rando message -m is message"
  git config --global user.name "Michael Teske" #applies everywhere you run git
  git config --local user.email michael.teske@outlook.com #applies in current repo
  git commit --amend --reset-author
  git status
  git push
  git push --set-upstream-orgin fix-it

```

* go to fork and do a new pull request







#### Chat Notes

```bash
#There's always a way out with git
#from Stephen Valdinger to everyone:
cd .. ; rm * -rf ; git clone $url