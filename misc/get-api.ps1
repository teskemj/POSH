Find-Module *google*
install-module googlecontactscmdlets
gcm -Module google*
help get-license
help invoke-googlecontacts
help Connect-GoogleContacts
help Connect-GoogleContacts -examples
find-module *bing*
install-module bing
Find-Module *choco*
install-module chocolateyget -force
gcm -Module ChocolateyGet
find-module *git*
find-module *git* | fl name,description
Find-Module *weather*
install-module psweather
gcm -Module psweather
help get-weather// for every command:
# {Command name}

## SYNOPSIS
{{Synopsis text}}

## DESCRIPTION
{{Description text}}

## PARAMETERS

// for every parameter
    // type and default value are non-mandatory
    ### {Parameter name} [{Parameter type}] = {Parameter default value}

    // parameter metadata
    ```powershell
    {{Parameter attributes as specified in param() block in PowerShell functions
    i.e. [Parameter(ParameterSetName = 'ByName')]
    }}
    ```

    {{Parameter description text}}

## INPUTS
// for every input type
    #### {Input type}
    {{Description text}}

## OUTPUTS
// for every output type
    ### {Output type}
    {{Description text}}

## EXAMPLES
// for every example
    ### {Example Name}

    ```powershell
    {{Example body}}
    ```
    {{Example text explanation}}

## RELATED LINKS

// for every link
    [{link name}]({link url})
get-weather -days 5
get-weather -zip 54115
get-weather -zip 54115 -days 15
cd\
cls
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft"
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft/chart/6m" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft/" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft/chart/1m" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft/day" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft/chart/1d" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft/chart/1d" -Method Get
cls
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/msft/chart/1d" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/apl/chart/1d" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/goog/chart/1d" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1d" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Get
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Default
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Default | select close
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Default | gm
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Default | select *
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Default | select * | gm
[Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Default
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/chart/1m" -Method Default
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/financials" -Method Default
Invoke-RestMethod -uri "https://api.iextrading.com/1.0/stock/csco/financials" -Method Default | fl
