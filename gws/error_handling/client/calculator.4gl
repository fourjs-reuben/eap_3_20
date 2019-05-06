#+
#+ Generated from calculator.4gl
#+
IMPORT com
IMPORT xml
IMPORT util
IMPORT os

#+
#+ Global Endpoint user-defined type definition
#+
TYPE tGlobalEndpointType RECORD # Rest Endpoint
    Address RECORD # Address
        Uri STRING # URI
    END RECORD,
    Binding RECORD # Binding
        Version STRING, # HTTP Version (1.0 or 1.1)
        ConnectionTimeout INTEGER, # Connection timeout
        ReadWriteTimeout INTEGER, # Read write timeout
        CompressRequest STRING # Compression (gzip or deflate)
    END RECORD
END RECORD

PUBLIC DEFINE Endpoint
    tGlobalEndpointType
    = (Address: (Uri: "http://localhost:8090/ws/r/Calculator"))

# Error codes
PUBLIC CONSTANT C_SUCCESS = 0
PUBLIC CONSTANT C_FATALERROR = 1001
PUBLIC CONSTANT C_SHOULD_NOT_HAPPEN = 1002

PUBLIC # fatal error
    DEFINE fatalError
    STRING

################################################################################
# Operation /Divide/{a}/{b}
#
# VERB: GET
#
PUBLIC FUNCTION divide(p_a INTEGER, p_b INTEGER) RETURNS (INTEGER, INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE resp_body INTEGER

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/Divide/{a}/{b}")
        CALL fullpath.replace("{a}", p_a, 1)
        CALL fullpath.replace("{b}", p_b, 1)

        # Create request and configure it
        LET req =
            com.HTTPRequest.Create(
                SFMT("%1%2", Endpoint.Address.Uri, fullpath.toString()))
        IF Endpoint.Binding.Version IS NOT NULL THEN
            CALL req.setVersion(Endpoint.Binding.Version)
        END IF
        IF Endpoint.Binding.ConnectionTimeout <> 0 THEN
            CALL req.setConnectionTimeout(Endpoint.Binding.ConnectionTimeout)
        END IF
        IF Endpoint.Binding.ReadWriteTimeout <> 0 THEN
            CALL req.setTimeout(Endpoint.Binding.ReadWriteTimeout)
        END IF
        IF Endpoint.Binding.CompressRequest IS NOT NULL THEN
            CALL req.setHeader(
                "Content-Encoding", Endpoint.Binding.CompressRequest)
        END IF

        # Perform request
        CALL req.setMethod("GET")
        CALL req.setHeader("Accept", "text/plain;q=0.9")
        CALL req.DoRequest()

        # Retrieve response
        LET resp = req.getResponse()
        # Process response
        INITIALIZE resp_body TO NULL
        LET contentType = resp.getHeader("Content-Type")
        CASE resp.getStatusCode()

            WHEN 200 #Success
                IF contentType MATCHES "*text/plain*" THEN
                    # Parse TEXT response
                    LET resp_body = resp.getTextResponse()
                    RETURN C_SUCCESS, resp_body
                END IF
                RETURN -1, resp_body

            WHEN 412 #fatal error
                IF contentType MATCHES "*text/plain*" THEN
                    # Parse TEXT response
                    LET fatalError = resp.getTextResponse()
                    RETURN C_FATALERROR, resp_body
                END IF
                RETURN -1, resp_body

            WHEN 406 #should not happen
                RETURN C_SHOULD_NOT_HAPPEN, resp_body

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body
        END CASE
    CATCH
        RETURN -1, resp_body
    END TRY
END FUNCTION
################################################################################
