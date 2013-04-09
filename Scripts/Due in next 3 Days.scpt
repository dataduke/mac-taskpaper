on getShortDate(now)
    set {day:d, year:y, time:t} to now

    -- Calculate the month number.
    copy now to b
    set b's month to January
    set m to (b - 2500000 - now) div -2500000

    -- Short date in yyyy-mm-dd format.
    tell (y * 10000 + m * 100 + d) as string
        set dateString to text 1 thru 4 & "-" & text 5 thru 6 & "-" & text 7 thru 8
    end tell

    return dateString
end getShortDate

set today to getShortDate(current date)
set soon to getShortDate((current date) + 3 * days)

set searchString to "(@due < \"" & soon & "\" or @today) and not @done"

tell application "TaskPaper"
    set the search field string of the front document to searchString
end tell