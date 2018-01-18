// for every command:
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