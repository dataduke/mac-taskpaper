tell application "TaskPaper"
    tell front document
        set x to search field string
        if x is not "" then
            set search field string to "(" & x & ") and type=task"
        else
            set search field string to "type=task"
        end if
    end tell
end tell