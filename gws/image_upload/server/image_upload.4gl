IMPORT os

FUNCTION put(
    image STRING ATTRIBUTE(WSMedia="image/*")
)
    ATTRIBUTES (WSPost, WSPath="/upload_image")

    -- File is uploaded to value of img ie temp directory.  You then need to copy somewhere sensible
    DISPLAY os.Path.copy(image, "last.png")
    DISPLAY image
END FUNCTION


