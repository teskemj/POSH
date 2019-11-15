Function prompt {
    # The at sign creates an array in case only one history item exists.
    $history = @(get-history)
    if ($history.Count -gt 0) {
        $lastItem = $history[$history.Count - 1]
        $lastId = $lastItem.Id
    }

    $nextCommand = $lastId + 1
    $currentDirectory = get-location
    "PS: $nextCommand $currentDirectory >"
}