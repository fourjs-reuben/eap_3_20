#+
#+ Generated from crud
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
    = (Address:(Uri: "http://localhost:8090/ws/r/CRUD"))

# Error codes
PUBLIC CONSTANT C_SUCCESS = 0
PUBLIC CONSTANT C_USERERROR_400 = 1001
PUBLIC CONSTANT C_USERERROR_404 = 1002

# generated userError_400ErrorType
PUBLIC TYPE userError_400ErrorType RECORD
    message STRING
END RECORD

# generated userError_404ErrorType
PUBLIC TYPE userError_404ErrorType RECORD
    message STRING
END RECORD

# generated listResponseBodyType
PUBLIC TYPE listResponseBodyType RECORD
    rows DYNAMIC ARRAY OF RECORD
        id INTEGER,
        str STRING,
        dmy DATE,
        num INTEGER
    END RECORD
END RECORD

# generated createRequestBodyType
PUBLIC TYPE createRequestBodyType RECORD
    id INTEGER,
    str STRING,
    dmy DATE,
    num INTEGER
END RECORD

# generated readResponseBodyType
PUBLIC TYPE readResponseBodyType RECORD
    id INTEGER,
    str STRING,
    dmy DATE,
    num INTEGER
END RECORD

# generated updateRequestBodyType
PUBLIC TYPE updateRequestBodyType RECORD
    id INTEGER,
    str STRING,
    dmy DATE,
    num INTEGER
END RECORD

PUBLIC # Default User error 400
    DEFINE userError_400
    userError_400ErrorType

PUBLIC # Default User error 404
DEFINE userError_404 userError_404ErrorType

################################################################################
# Operation /tableName
#
# VERB: GET
#
PUBLIC FUNCTION list() RETURNS(INTEGER, listResponseBodyType)
    DEFINE fullpath base.StringBuffer
    DEFINE contentType STRING
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE xml_resp_body RECORD ATTRIBUTE(XMLName = 'data')
        rows
            DYNAMIC ARRAY ATTRIBUTE(XMLList) OF
            RECORD ATTRIBUTE(XMLName = 'element')
            id INTEGER,
            str STRING,
            dmy DATE,
            num INTEGER
        END RECORD
    END RECORD
    DEFINE resp_body listResponseBodyType
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE json_body STRING

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/tableName")

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

            WHEN 200 #Returns all rows of a database table
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
                    CALL xml.serializer.DomToVariable(xml_node, xml_resp_body)
                    LET resp_body.* = xml_resp_body.*
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
#
# VERB: POST
# DESCRIPTION: Inserts a row into a database table
#
PUBLIC FUNCTION create(p_body createRequestBodyType) RETURNS(INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE contentType STRING
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE json_body STRING

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/tableName")

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
        # Perform JSON request
        CALL req.setHeader("Content-Type", "application/json")
        LET json_body = util.JSON.stringify(p_body)
        CALL req.DoTextRequest(json_body)

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

################################################################################
# Operation /tableName/length
#
# VERB: GET
# DESCRIPTION: Returns number of rows in database table
#
PUBLIC FUNCTION len() RETURNS(INTEGER, INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE contentType STRING
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE resp_body INTEGER

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/tableName/length")

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
# Operation /tableName/{id}
#
# VERB: GET
# DESCRIPTION: Returns a row of a database table
#
PUBLIC FUNCTION read(p_id INTEGER) RETURNS(INTEGER, readResponseBodyType)
    DEFINE fullpath base.StringBuffer
    DEFINE contentType STRING
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE xml_userError_400 STRING
    DEFINE xml_userError_404 STRING
    DEFINE resp_body readResponseBodyType
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE json_body STRING

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/tableName/{id}")
        CALL fullpath.replace("{id}", p_id, 1)

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
        CALL req.setHeader(
            "Accept", "application/json, application/xml, text/xml")
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

            WHEN 400 #Default User error 400
                IF contentType MATCHES "*application/json*" THEN
                    # Parse JSON response
                    LET json_body = resp.getTextResponse()
                    CALL util.JSON.parse(json_body, userError_400)
                    RETURN C_USERERROR_400, resp_body.*
                END IF
                IF contentType MATCHES "*application/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_400)
                    RETURN C_USERERROR_400, resp_body.*
                END IF
                IF contentType MATCHES "*text/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_400)
                    RETURN C_USERERROR_400, resp_body.*
                END IF
                RETURN -1, resp_body.*

            WHEN 404 #Default User error 404
                IF contentType MATCHES "*application/json*" THEN
                    # Parse JSON response
                    LET json_body = resp.getTextResponse()
                    CALL util.JSON.parse(json_body, userError_404)
                    RETURN C_USERERROR_404, resp_body.*
                END IF
                IF contentType MATCHES "*application/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_404)
                    RETURN C_USERERROR_404, resp_body.*
                END IF
                IF contentType MATCHES "*text/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_404)
                    RETURN C_USERERROR_404, resp_body.*
                END IF
                RETURN -1, resp_body.*

            OTHERWISE
                RETURN resp.getStatusCode(), resp_body.*
        END CASE
    CATCH
        RETURN -1, resp_body.*
    END TRY
END FUNCTION
#
# VERB: PUT
# DESCRIPTION: Updates a row in a database table
#
PUBLIC FUNCTION update(
    p_id INTEGER, p_body updateRequestBodyType)
    RETURNS(INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE contentType STRING
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE xml_userError_400 STRING
    DEFINE xml_userError_404 STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE json_body STRING

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/tableName/{id}")
        CALL fullpath.replace("{id}", p_id, 1)

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
        CALL req.setMethod("PUT")
        CALL req.setHeader(
            "Accept", "application/json, application/xml, text/xml")
        # Perform JSON request
        CALL req.setHeader("Content-Type", "application/json")
        LET json_body = util.JSON.stringify(p_body)
        CALL req.DoTextRequest(json_body)

        # Retrieve response
        LET resp = req.getResponse()
        # Process response
        LET contentType = resp.getHeader("Content-Type")
        CASE resp.getStatusCode()

            WHEN 204 #No Content
                RETURN C_SUCCESS

            WHEN 400 #Default User error 400
                IF contentType MATCHES "*application/json*" THEN
                    # Parse JSON response
                    LET json_body = resp.getTextResponse()
                    CALL util.JSON.parse(json_body, userError_400)
                    RETURN C_USERERROR_400
                END IF
                IF contentType MATCHES "*application/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_400)
                    RETURN C_USERERROR_400
                END IF
                IF contentType MATCHES "*text/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_400)
                    RETURN C_USERERROR_400
                END IF
                RETURN -1

            WHEN 404 #Default User error 404
                IF contentType MATCHES "*application/json*" THEN
                    # Parse JSON response
                    LET json_body = resp.getTextResponse()
                    CALL util.JSON.parse(json_body, userError_404)
                    RETURN C_USERERROR_404
                END IF
                IF contentType MATCHES "*application/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_404)
                    RETURN C_USERERROR_404
                END IF
                IF contentType MATCHES "*text/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_404)
                    RETURN C_USERERROR_404
                END IF
                RETURN -1

            OTHERWISE
                RETURN resp.getStatusCode()
        END CASE
    CATCH
        RETURN -1
    END TRY
END FUNCTION
#
# VERB: DELETE
# DESCRIPTION: Deletes a row in a database table
#
PUBLIC FUNCTION delete(p_id INTEGER) RETURNS(INTEGER)
    DEFINE fullpath base.StringBuffer
    DEFINE contentType STRING
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE xml_userError_400 STRING
    DEFINE xml_userError_404 STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE json_body STRING

    TRY

        # Prepare request path
        LET fullpath = base.StringBuffer.Create()
        CALL fullpath.append("/tableName/{id}")
        CALL fullpath.replace("{id}", p_id, 1)

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
        CALL req.setMethod("DELETE")
        CALL req.setHeader(
            "Accept", "application/json, application/xml, text/xml")
        CALL req.DoRequest()

        # Retrieve response
        LET resp = req.getResponse()
        # Process response
        LET contentType = resp.getHeader("Content-Type")
        CASE resp.getStatusCode()

            WHEN 204 #No Content
                RETURN C_SUCCESS

            WHEN 400 #Default User error 400
                IF contentType MATCHES "*application/json*" THEN
                    # Parse JSON response
                    LET json_body = resp.getTextResponse()
                    CALL util.JSON.parse(json_body, userError_400)
                    RETURN C_USERERROR_400
                END IF
                IF contentType MATCHES "*application/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_400)
                    RETURN C_USERERROR_400
                END IF
                IF contentType MATCHES "*text/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_400)
                    RETURN C_USERERROR_400
                END IF
                RETURN -1

            WHEN 404 #Default User error 404
                IF contentType MATCHES "*application/json*" THEN
                    # Parse JSON response
                    LET json_body = resp.getTextResponse()
                    CALL util.JSON.parse(json_body, userError_404)
                    RETURN C_USERERROR_404
                END IF
                IF contentType MATCHES "*application/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_404)
                    RETURN C_USERERROR_404
                END IF
                IF contentType MATCHES "*text/xml*" THEN
                    # Parse XML response
                    LET xml_body = resp.getXmlResponse()
                    LET xml_node = xml_body.getDocumentElement()
                    CALL xml.serializer.DomToVariable(xml_node, userError_404)
                    RETURN C_USERERROR_404
                END IF
                RETURN -1

            OTHERWISE
                RETURN resp.getStatusCode()
        END CASE
    CATCH
        RETURN -1
    END TRY
END FUNCTION
################################################################################
