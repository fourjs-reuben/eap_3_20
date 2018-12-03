#+
#+ Generated from image_download.4gl
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

PRIVATE CONSTANT C_SERVER_URL = 'http://localhost:8090/ws/r/Image_Download'
PUBLIC DEFINE Endpoint tGlobalEndpointType

# Error codes
PUBLIC CONSTANT C_SUCCESS = 0


################################################################################
# Operation /list
#
# VERB: GET
#
PUBLIC FUNCTION list(
    ) RETURNS (INTEGER,
        RECORD ATTRIBUTE(XMLName = 'list') files
                DYNAMIC ARRAY ATTRIBUTE(XMLList) OF
                STRING ATTRIBUTE(XMLName = 'element')
            END RECORD)
    DEFINE fullpath base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE resp_body RECORD ATTRIBUTE(XMLName = 'list')
        files
            DYNAMIC ARRAY ATTRIBUTE(XMLList) OF
            STRING ATTRIBUTE(XMLName = 'element')
    END RECORD 

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/list")

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
        CALL req.setHeader("Accept", "application/json, application/xml")
        CALL req.DoRequest()

        # Retrieve response
        LET resp = req.getResponse()
        # Process response
        INITIALIZE resp_body TO NULL
        LET contentType = resp.getHeader("Content-Type")
        CASE resp.getStatusCode()

            WHEN 200 #Success
                IF contentType MATCHES "*application/json*" THEN
                    # Parse JSON response
                    LET json_body = resp.getTextResponse()
                    CALL util.JSON.parse(json_body, resp_body)
                    RETURN C_SUCCESS, resp_body.*
                END IF
                IF contentType MATCHES "*application/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, resp_body)
                    RETURN C_SUCCESS, resp_body.*
                END IF
                RETURN -1, resp_body.*

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body.*
        END CASE
    CATCH
        RETURN -1, resp_body.*
    END TRY
END FUNCTION
################################################################################

################################################################################
# Operation /get
#
# VERB: GET
#
PUBLIC FUNCTION get(p_filename STRING) RETURNS (INTEGER, STRING)
    DEFINE fullpath base.StringBuffer
    DEFINE query base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE resp_body STRING

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        LET query = base.StringBuffer.Create()
        CALL fullpath.append("/get")
        IF p_filename IS NOT NULL THEN
            IF query.getLength() > 0 THEN
                CALL query.append(SFMT("&filename=%1", p_filename))
            ELSE
                CALL query.append(SFMT("filename=%1", p_filename))
            END IF
        END IF
        IF query.getLength() > 0 THEN
            CALL fullpath.append("?")
            CALL fullpath.append(query.toString())
        END IF

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
        CALL req.setHeader("Accept", "*/*")
        CALL req.DoRequest()

        # Retrieve response
        LET resp = req.getResponse()
        # Process response
        INITIALIZE resp_body TO NULL
        LET contentType = resp.getHeader("Content-Type")
        CASE resp.getStatusCode()

            WHEN 200 #Success
                IF contentType MATCHES "*/*" THEN
                    # Parse FILE response
                    LET resp_body = resp.getFileResponse()
                    RETURN C_SUCCESS, resp_body
                END IF
                RETURN -1, resp_body

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body
        END CASE
    CATCH
        RETURN -1, resp_body
    END TRY
END FUNCTION
################################################################################
