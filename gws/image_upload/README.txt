This example will allow the user to select a file via openFile front-call.
The resultant filename is then uploaded via the Web Service call where the
service will copy the file to "last.png" in the server folder
The test program will then display this file (note: the test program is in 
client folder but will reference the file in server folder)

The key thing to note at runtime is the value of image that is passed into the
Web Service function is the value where the uploaded file is located.