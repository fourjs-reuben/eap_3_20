MAIN
DEFINE rec RECORD
    key1, key2 STRING,
    data11,data12, data13 STRING,
    data21,data22, data23 STRING,
    data31,data32, data33 STRING --,
    --data41,data42, data43 STRING,
    --data51,data52, data53 STRING,
    --data61,data62, data63 STRING
END RECORD

    CLOSE WINDOW SCREEN
    CALL ui.Interface.loadStyles("collapsible_groupbox.4st")

    OPEN WINDOW w WITH FORM "collapsible_groupbox"
    INPUT BY NAME rec.* 
    CLOSE WINDOW w

    OPEN WINDOW w WITH FORM "collapsible_groupbox_withstretch"
    INPUT BY NAME rec.*
    CLOSE WINDOW w
END MAIN
    