#+
#+ Generated from upload.4gl
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

PRIVATE CONSTANT C_SERVER_URL = 'http://localhost:8090/ws/r/Image_Upload'
PUBLIC DEFINE Endpoint tGlobalEndpointType

# Error codes
PUBLIC CONSTANT C_SUCCESS = 0

################################################################################
# Operation /upload_image
#
# VERB: POST
#
PUBLIC FUNCTION put(p_body STRING) RETURNS (INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/upload_image")

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
        CALL req.setMethod("POST")
        # Perform FILE request
        CALL req.DoFileRequest(p_body)

        # Retrieve response
        LET resp = req.getResponse()
        # Process response
        LET contentType = resp.getHeader("Content-Type")
        CASE resp.getStatusCode()

            WHEN 204 #No Content
                RETURN C_SUCCESS

            OTHERWISE
                RETURN resp.getStatusCode()
        END CASE
    CATCH
        RETURN -1
    END TRY
END FUNCTION
################################################################################
