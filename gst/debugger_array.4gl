MAIN
DEFINE i INTEGER
DEFINE arr DYNAMIC ARRAY OF STRING
DEFINE dict DICTIONARY OF INTEGER

    LET arr[1] = "Monday"    
    LET arr[2] = "Tuesday"
    LET arr[3] = "Wednesday"
    LET arr[4] = "Thursday"
    LET arr[5] = "Friday"
    LET arr[6] = "Saturday"
    LET arr[7] = "Sunday"
    FOR i = 1 TO 7
        LET dict[arr[i]] = i
    END FOR
    BREAKPOINT
    BREAKPOINT
END MAIN
