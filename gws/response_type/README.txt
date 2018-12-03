Command used to generate calculator.4gl in calculator_client.4gl

fglrestful -o calculator.4gl http://localhost:8090/ws/r/Calculator?openapi.json

The key thing with this example is the different response formats and how you 
can manipulate if plain text, json, xml

To verify run the server program and run curl from the command line ...



curl "http://localhost:8090/Calculator/Add/json?a=1&b=2"
Output will be JSON

curl "http://localhost:8090/Calculator/Add/xml?a=1&b=2"
Output will be XML

Google geocode Web Services uses above technique to allow end-user to choose
json or xml

curl "http://localhost:8090/Calculator/Add?a=1&b=2"
Output will default to JSON due to order of WSMedia arguments

curl --header 'Accept: application/json' "http://localhost:8090/Calculator/Add?a=1&b=2"
Output will be forced to JSON

curl --header 'Accept: application/xml' "http://localhost:8090/Calculator/Add?a=1&b=2"
Output will be forced to XML

curl "http://localhost:8090/Calculator/Add/simple?a=1&b=2"
Output will be a number


