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

PRIVATE CONSTANT C_SERVER_URL = 'http://localhost:8090/ws/r/Calculator'
PUBLIC DEFINE Endpoint tGlobalEndpointType

# Error codes
PUBLIC CONSTANT C_SUCCESS = 0

################################################################################
# Operation /Add_wsheader
#
# VERB: GET
#
PUBLIC FUNCTION add_wsheader(
    p_a INTEGER, p_b INTEGER)
    RETURNS (INTEGER, INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE resp_body INTEGER

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/Add_wsheader")

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
        IF p_a IS NOT NULL THEN
            CALL req.setHeader("a", p_a)
        END IF
        IF p_b IS NOT NULL THEN
            CALL req.setHeader("b", p_b)
        END IF
        CALL req.setHeader("Accept", "text/plain")
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

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body
        END CASE
    CATCH
        RETURN -1, resp_body
    END TRY
END FUNCTION
################################################################################

################################################################################
# Operation /Add_wscookie
#
# VERB: GET
#
PUBLIC FUNCTION add_wscookie(
    p_a INTEGER, p_b INTEGER)
    RETURNS (INTEGER, INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE cookie base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE resp_body INTEGER

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        LET cookie = base.StringBuffer.Create()
        CALL fullpath.append("/Add_wscookie")

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
        IF p_a IS NOT NULL THEN
            IF cookie.getLength() > 0 THEN
                CALL cookie.append(SFMT(";a=%1", p_a))
            ELSE
                CALL cookie.append(SFMT("a=%1", p_a))
            END IF
        END IF
        IF p_b IS NOT NULL THEN
            IF cookie.getLength() > 0 THEN
                CALL cookie.append(SFMT(";b=%1", p_b))
            ELSE
                CALL cookie.append(SFMT("b=%1", p_b))
            END IF
        END IF
        IF cookie.getLength() > 0 THEN
            CALL req.setHeader("Cookie", cookie.toString())
        END IF
        CALL req.setHeader("Accept", "text/plain")
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

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body
        END CASE
    CATCH
        RETURN -1, resp_body
    END TRY
END FUNCTION
################################################################################

################################################################################
# Operation /Add_wsquery
#
# VERB: GET
#
PUBLIC FUNCTION add_wsquery(p_a INTEGER, p_b INTEGER) RETURNS (INTEGER, INTEGER)
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
    DEFINE resp_body INTEGER

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        LET query = base.StringBuffer.Create()
        CALL fullpath.append("/Add_wsquery")
        IF p_a IS NOT NULL THEN
            IF query.getLength() > 0 THEN
                CALL query.append(SFMT("&a=%1", p_a))
            ELSE
                CALL query.append(SFMT("a=%1", p_a))
            END IF
        END IF
        IF p_b IS NOT NULL THEN
            IF query.getLength() > 0 THEN
                CALL query.append(SFMT("&b=%1", p_b))
            ELSE
                CALL query.append(SFMT("b=%1", p_b))
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
        CALL req.setHeader("Accept", "text/plain")
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

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body
        END CASE
    CATCH
        RETURN -1, resp_body
    END TRY
END FUNCTION
################################################################################

################################################################################
# Operation /Add_wsparam/{a}/{b}
#
# VERB: GET
#
PUBLIC FUNCTION add_wsparam(p_a INTEGER, p_b INTEGER) RETURNS (INTEGER, INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE resp_body INTEGER

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/Add_wsparam/{a}/{b}")
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
        CALL req.setHeader("Accept", "text/plain")
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

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body
        END CASE
    CATCH
        RETURN -1, resp_body
    END TRY
END FUNCTION
################################################################################
