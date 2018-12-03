#+
#+ Generated from crud.4gl
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

PRIVATE CONSTANT C_SERVER_URL = 'http://localhost:8090/ws/r/CRUD'
PUBLIC DEFINE Endpoint tGlobalEndpointType

# Error codes
PUBLIC CONSTANT C_SUCCESS = 0

################################################################################
# Operation /tableName
#
# VERB: GET
#
PUBLIC FUNCTION list(
    ) RETURNS (INTEGER,
        RECORD ATTRIBUTE(XMLName = 'data') rows
            DYNAMIC ARRAY ATTRIBUTE(XMLList) OF
            RECORD ATTRIBUTE(XMLName = 'element')
    id INTEGER ATTRIBUTE(XMLName = 'id'),
    str STRING ATTRIBUTE(XMLName = 'str'),
    dmy DATE ATTRIBUTE(XMLName = 'dmy'),
    num INTEGER ATTRIBUTE(XMLName = 'num')
END RECORD END RECORD)
    DEFINE fullpath base.StringBuffer
    DEFINE req com.HTTPRequest
    DEFINE resp com.HTTPResponse
    DEFINE part com.HttpPart
    DEFINE ind INTEGER
    DEFINE contentType STRING
    DEFINE json_body STRING
    DEFINE xml_body xml.DomDocument
    DEFINE xml_node xml.DomNode
    DEFINE resp_body RECORD ATTRIBUTE(XMLName = 'data')
        rows
            DYNAMIC ARRAY ATTRIBUTE(XMLList) OF
            RECORD ATTRIBUTE(XMLName = 'element')
            id INTEGER ATTRIBUTE(XMLName = 'id'),
            str STRING ATTRIBUTE(XMLName = 'str'),
            dmy DATE ATTRIBUTE(XMLName = 'dmy'),
            num INTEGER ATTRIBUTE(XMLName = 'num')
        END RECORD
    END RECORD

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

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
#
# VERB: POST
#
PUBLIC FUNCTION create(
    p_body RECORD ATTRIBUTE(XMLName = 'data') id
                INTEGER ATTRIBUTE(XMLName = 'id'),
            str STRING ATTRIBUTE(XMLName = 'str'),
            dmy DATE ATTRIBUTE(XMLName = 'dmy'),
            num INTEGER ATTRIBUTE(XMLName = 'num')
        END RECORD)
    RETURNS (INTEGER)
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
        # Perform XML request
        LET xml_body = xml.DomDocument.Create()
        LET xml_node = xml_body.createDocumentFragment()
        CALL xml.serializer.VariableToDom(p_body, xml_node)
        CALL xml_body.appendDocumentNode(xml_node)
        CALL req.setHeader("Content-Type", "application/xml")
        CALL req.DoXmlRequest(xml_body)

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
#
PUBLIC FUNCTION len() RETURNS (INTEGER, INTEGER)
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
#
PUBLIC FUNCTION read(
    p_id INTEGER)
    RETURNS (INTEGER,
        RECORD ATTRIBUTE(XMLName = 'rec') id INTEGER ATTRIBUTE(XMLName = 'id'),
                str STRING ATTRIBUTE(XMLName = 'str'),
                dmy DATE ATTRIBUTE(XMLName = 'dmy'),
                num INTEGER ATTRIBUTE(XMLName = 'num')
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
    DEFINE resp_body RECORD ATTRIBUTE(XMLName = 'rec')
        id INTEGER ATTRIBUTE(XMLName = 'id'),
        str STRING ATTRIBUTE(XMLName = 'str'),
        dmy DATE ATTRIBUTE(XMLName = 'dmy'),
        num INTEGER ATTRIBUTE(XMLName = 'num')
    END RECORD

    # Set Server endpoint
    IF Endpoint.Address.Uri IS NULL THEN
        LET Endpoint.Address.Uri = C_SERVER_URL
    END IF

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
#
# VERB: PUT
#
PUBLIC FUNCTION update(
    p_id INTEGER,
    p_body RECORD ATTRIBUTE(XMLName = 'data') id
                INTEGER ATTRIBUTE(XMLName = 'id'),
            str STRING ATTRIBUTE(XMLName = 'str'),
            dmy DATE ATTRIBUTE(XMLName = 'dmy'),
            num INTEGER ATTRIBUTE(XMLName = 'num')
        END RECORD)
    RETURNS (INTEGER)
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
        # Perform XML request
        LET xml_body = xml.DomDocument.Create()
        LET xml_node = xml_body.createDocumentFragment()
        CALL xml.serializer.VariableToDom(p_body, xml_node)
        CALL xml_body.appendDocumentNode(xml_node)
        CALL req.setHeader("Content-Type", "application/xml")
        CALL req.DoXmlRequest(xml_body)

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
#
# VERB: DELETE
#
PUBLIC FUNCTION delete(p_id INTEGER) RETURNS (INTEGER)
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
        CALL req.DoRequest()

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
