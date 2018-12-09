IMPORT util
MAIN
DEFINE arr DYNAMIC ARRAY OF RECORD
    major CHAR(33),
    minor CHAR(17),
    team STRING,
    win, draw, loss, for, against, gd, pts INTEGER
END RECORD
DEFINE i, j, g1, g2 INTEGER

    CALL ui.Interface.loadStyles("multicolumntable.4st")

    # Create with alternative form using table, scrollgrid, generate a grid

    LET arr[1].team = "New Zealand"
    LET arr[2].team = "Australia"
    LET arr[3].team = "USA"
    LET arr[4].team = "Mexico"
    LET arr[5].team = "Argentina"
    LET arr[6].team = "UK"
    LET arr[7].team = "France"
    LET arr[8].team = "Germany"
    LET arr[9].team = "Spain"
    FOR i = 1 TO arr.getLength()
        LET arr[i].win = 0
        LET arr[i].draw = 0
        LET arr[i].loss = 0
        LET arr[i].for = 0
        LET arr[i].against = 0
    END FOR
    FOR i = 1 TO arr.getLength()
        FOR j = 1 TO arr.getLength()
            IF i <> j THEN
                LET g1 = util.Math.rand(5)
                LET g2 = util.Math.rand(5)
                LET arr[i].win = arr[i].win + IIF(g1>g2,1,0)
                LET arr[i].draw = arr[i].draw + IIF(g1=g2,1,0)
                LET arr[i].loss = arr[i].loss + IIF(g1<g2,1,0)
                LET arr[j].win = arr[j].win + IIF(g1<g2,1,0)
                LET arr[j].draw = arr[j].draw + IIF(g1=g2,1,0)
                LET arr[j].loss = arr[j].loss + IIF(g1>g2,1,0)

                LET arr[i].for = arr[i].for + g1
                LET arr[i].against = arr[i].against + g2
                LET arr[j].for = arr[j].for + g2
                LET arr[j].against = arr[j].against + g1
            END IF
        END FOR
    END FOR
    FOR i = 1 TO arr.getLength()
        LET arr[i].pts = 3 * arr[i].win + arr[i].draw
        LET arr[i].gd = arr[i].for = arr[i].against
    END FOR
    CALL arr.sort("for", TRUE)
    CALL arr.sort("gd", TRUE)
    CALL arr.sort("pts", TRUE)

    CLOSE WINDOW SCREEN

    OPEN WINDOW w WITH FORM "multicolumntable_listview"
    DISPLAY ARRAY arr TO scr.*
         BEFORE DISPLAY
         FOR i = 1 TO arr.getLength()
            LET arr[i].major[1,15] = arr[i].team
            LET arr[i].major[17,18] = arr[i].win USING "#&"
            LET arr[i].major[20,21] = arr[i].draw USING "#&"
            LET arr[i].major[23,24] = arr[i].loss USING "#&"
            LET arr[i].major[26,27] = arr[i].for USING "#&"
            LET arr[i].major[29,30] = arr[i].against USING "#&"
            LET arr[i].major[32,33] = arr[i].pts USING "#&"
            END FOR
    END DISPLAY
    CLOSE WINDOW w
    
    OPEN WINDOW w WITH FORM "multicolumntable_listview_2col"
    DISPLAY ARRAY arr TO scr.*
         BEFORE DISPLAY
         FOR i = 1 TO arr.getLength()
            LET arr[i].major = arr[i].team
            LET arr[i].minor[1,2] = arr[i].win USING "#&"
            LET arr[i].minor[4,5] = arr[i].draw USING "#&"
            LET arr[i].minor[7,8] = arr[i].loss USING "#&"
            LET arr[i].minor[10,11] = arr[i].for USING "#&"
            LET arr[i].minor[13,14] = arr[i].against USING "#&"
            LET arr[i].minor[16,17] = arr[i].pts USING "#&"
            END FOR
    END DISPLAY
    CLOSE WINDOW w

     OPEN WINDOW w WITH FORM "multicolumntable_listview_2col_number"
     DISPLAY ARRAY arr TO scr.*
         BEFORE DISPLAY
         FOR i = 1 TO arr.getLength()
            LET arr[i].major = arr[i].team
            LET arr[i].minor[1,2] = arr[i].win USING "#&"
            LET arr[i].minor[4,5] = arr[i].draw USING "#&"
            LET arr[i].minor[7,8] = arr[i].loss USING "#&"
            LET arr[i].minor[10,11] = arr[i].for USING "#&"
            LET arr[i].minor[13,14] = arr[i].against USING "#&"
            LET arr[i].minor[16,17] = arr[i].pts USING "#&"
            END FOR
    END DISPLAY
    CLOSE WINDOW w

    
    OPEN WINDOW w WITH FORM "multicolumntable_table"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w
    
    OPEN WINDOW w WITH FORM "multicolumntable_scrollgrid"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w

    OPEN WINDOW w WITH FORM "multicolumntable_scrollgrid_label"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w
    
    OPEN WINDOW w WITH FORM "multicolumntable_scrollgrid_layouttag"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w

    OPEN WINDOW w WITH FORM "multicolumntable_scrollgrid_layouttag_label"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w
    
    OPEN WINDOW w WITH FORM "multicolumntable_matrix"
    DISPLAY ARRAY arr TO scr.*
    CLOSE WINDOW w
     

       
            
END MAIN