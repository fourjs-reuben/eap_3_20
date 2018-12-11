--Copy and paste example from below, uncomment, then run formatter
MAIN
    SELECT column1, column2, column3, column1, column2, column3, column1, column2, column3, column1, column2, column3
        FROM table t1, table t2
        WHERE t1.key = t2.key
        ORDER BY t1.key
END MAIN

-- small example that will show case word uppercase and indentation
--main
--display "hello world"
--end main

-- example of comman being inserted
--main
--    select abc,def
--    from table
--end main

-- example of packing, indentation
--main
--    select column1, column2, column3, column1, column2, column3, column1, column2, column3, column1, column2, column3
--    from table t1, table t2
--    where t1.key = t2.key
--    order by t1.key
--end main
