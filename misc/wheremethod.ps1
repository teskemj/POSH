cd
cd\
gsv | gm
cls
$p = get-process
$p | ? name -like "power*"
$p.where($_.name -like "power*")
$p.where({$_.name -like "power*"})
