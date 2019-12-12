MAIN
DEFINE i   INTEGER
DEFINE foo STRING

DEFINE j   INTEGER,
       bar STRING

END MAIN

-- global action typically defined in include file
--&define END_INPUT ON ACTION help CALL show_help() ON IDLE 300 CALL tidy_exit() END INPUT
--FUNCTION sample_input()
--    DEFINE foo STRING
--
--    INPUT BY NAME foo
--        END_INPUT
--END FUNCTION

--MAIN
--    DEFINE p1, p2 INTEGER
--    DEFINE bar STRING
--
--    DISPLAY "Hello"
--    INPUT BY NAME bar
--        ON ACTION xxx
--            IF TRUE
--                THEN
--                &include "include.inc"
--    END INPUT
--END MAIN

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

--MAIN
--  &define FOO BAR
--  DISPLAY "Hello"
--END MAIN

--    DEFINE s STRING
--    &define END_INPUT ON ACTION help CALL show_help() \
--    ON IDLE 30 CALL exit_program() \
--    END INPUT
--
--    INPUT BY NAME s
--        END_INPUT
--MAIN
--    &define VERSION_STRING(p1) DISPLAY #p1
--
--    VERSION_STRING(1.2.3)
--    VERSION_STRING(a.b.c)
--    VERSION_STRING(a.2.3)
--    VERSION_STRING(1.b.3)
--    VERSION_STRING(1.2.c)
--    VERSION_STRING(1.b.c)
--    VERSION_STRING(a.2.c)
--    VERSION_STRING(a.b.3)
--    VERSION_STRING(a.b.c)
--
--END MAIN

--MAIN
--    SELECT columna
--    ,columnb
--    ,columnc
--    ,columnd
--    ,columne
--    ,columnf
--    ,columng
--    ,columnh
--    FROM tablename
--
--END MAIN

--MAIN
--CONSTANT   # A Constants
--    A1    STRING = "A1",   #A1
--    B1    STRING = "B1",   #B1
--
--    # B Constants
--    A2    STRING = "A2",   #A2
--    B2    STRING = "B2",   #B2
--
--    # C Constants
--    A3    STRING = "A3",   #A3
--    B3    STRING = "B3"    #B3
--
--
--END MAIN

--MAIN
--    CALL foo()
--    CALL bar()
--END MAIN
--
--
--
--FUNCTION foo()
--END FUNCTION
--
--
--
--FUNCTION bar()
--END FUNCTION
