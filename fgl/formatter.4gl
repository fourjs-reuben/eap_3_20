--Copy and paste example from below, uncomment, then run formatter
MAIN
DEFINE l_rec RECORD
    column1, column2, column3, column4, column5, column6 STRING
END RECORD
    
    SELECT column1, column2, column3,  
           column4, column5, column6
    INTO l_rec.column1, l_rec.column2, l_rec.column3,
         l_rec.column4, l_rec.column5, l_rec.column6
    FROM table

    INPUT l_rec.column1, l_rec.column2, l_rec.column3,
         l_rec.column4, l_rec.column5, l_rec.column6
    FROM c1, c2, c3,
         c4, c5, c6

END MAIN

-- small example that will show case word uppercase and indentation
--main
--display "hello world"
--end main



-- example of space being inserted around comma
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



-- note, no option if you like lower  case
--function lower_case_is_my_standard()
--    display "hello world"
--    display "HELLO WORLD"
--end function



-- standard of 3 lines between FUNCTION gets compressed
-- FGL-4952 to resolve
--FUNCTION a()
--END FUNCTION
--
--
--
--FUNCTION b()
--END FUNCTION



-- alignment of data types is not maintained
-- also in FGL-4952
--MAIN
--DEFINE i   INTEGER
--DEFINE foo STRING
--
--DEFINE j   INTEGER,
--       bar STRING
--
--END MAIN



-- retaining related clause patterns
-- note how the select.into and input/from have a pattern of 3 clauses per
-- line.  After the beautifier, this is no longer the case
--MAIN
--DEFINE l_rec RECORD
--    column1, column2, column3, column4, column5, column6 STRING
--END RECORD
--    
--    SELECT column1, column2, column3,  
--           column4, column5, column6
--    INTO l_rec.column1, l_rec.column2, l_rec.column3,
--         l_rec.column4, l_rec.column5, l_rec.column6
--    FROM table
--
--    INPUT l_rec.column1, l_rec.column2, l_rec.column3,
--         l_rec.column4, l_rec.column5, l_rec.column6
--    FROM c1, c2, c3,
--         c4, c5, c6
--
--END MAIN



