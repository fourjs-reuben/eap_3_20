MAIN
DEFINE s STRING
DEFINE tok base.StringTokenizer

    CALL colour(255,0,0)
    CALL colour(red:255, green:0, blue:0)

    -- Won't compile
    --CALL colour(green:255, red:0, blue:0)

    -- TODO we shoud allow defaults
    -- CALL colour(red:255)

    -- Also works with built-in methods
    LET s = "The quick brown fox"
    DISPLAY s.subString(startIndex:5, endIndex:9)

    LET tok = base.StringTokenizer.createExt("|aaa||b\\|bb|ccc", "|", "\\", TRUE)
    LET tok = base.StringTokenizer.createExt(str:"|aaa||b\\|bb|ccc", delimiters:"|", escapeChar:"\\", withNulls:TRUE)

    --CALL fgl_report_configureXLSXOutput(NULL, NULL, NULL, NULL, NULL, NULL, NULL)
  --  CALL fgl_report_configureXLSXDevice (fromPage:NULL,toPage:NULL,removeWhitespace:NULL,ignoreRowAlignment:NULL, ignoreColumnAlignment:NULL, removeBackgroundImages:NULL,mergePages:NULL)
    -- CALL fgl_report_configureXLSXDevice (fmergePages:NULL)
END MAIN



FUNCTION colour(red INTEGER, green INTEGER, blue INTEGER)
    DISPLAY SFMT("Red=%1,Green=%2,Blue=%3", red, green, blue)
END FUNCTION