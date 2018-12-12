IMPORT FGL qualify_imports1
IMPORT FGL qualify_imports2
IMPORT FGL qualify_imports3

-- Copy the code below into the MAIN
-- Uncomment and run qualify import
MAIN
    CALL aaa()
    CALL bbb()
    CALL ccc()
    CALL qualify_imports1.init()
    CALL qualify_imports2.init()
    CALL qualify_imports3.init()
    CALL lll()
END MAIN



-- #Copy the code below into the MAIN
-- #Uncomment and run qualify import
--MAIN
--    CALL aaa()
--    CALL bbb()
--    CALL ccc()
--  #Test it doesn't change these below
--    CALL qualify_imports1.init()
--    CALL qualify_imports2.init()
--    CALL qualify_imports3.init()
-- # see if it qualifies a linked function
--    CALL lll()
--END MAIN
