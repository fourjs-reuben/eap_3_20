Command used to generate calculator.4gl in calculator_client.4gl

fglrestful -o calculator.4gl http://localhost:8090/ws/r/Calculator?openapi.json

The key thing with this example is that when calculator_client.4gl runs, it runs
with FGLWSDEBUG = 3.  It passes the same information in 4 different formats to
the server program.

If the two numbers to be added together are 1,2 than you should observe the 
following...

WSParam - /ws/r/Calculator/Add_wsparam/1/2
The parameters are passed as part of the URL
There are more advanced options that will specify where they are placed in the
URL

WSQuery - /ws/r/Calculator/Add_wsquery?a=1&b=2
The parameters are passed as query parameters within the URL
There are more advanved options that allow you to control the public names of
the variables

WSCookie - /ws/r/Calculator/Add_wscookie (from the headers Cookie: a=1;b=2)
The parameters are passed as cookies, so not visible in the URL
There are more advanced options that allow you to control the names of the 
variables in the cookie

WSHeader - /ws/r/Calculator/Add_wsheader  (from the headers a:1 b:1)
The parameters are passed as headers so not visible in the URL
There are more advanced options that allow you to control the names of the 
variables in the headers