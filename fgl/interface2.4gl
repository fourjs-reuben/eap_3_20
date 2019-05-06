
               



TYPE recordType INTERFACE
    title() RETURNS STRING,
    -- Rules that relate to a whole database table
    can_view() RETURNS BOOLEAN,
    can_add() RETURNS BOOLEAN,
    can_update() RETURNS BOOLEAN,
    can_delete() RETURNS BOOLEAN,
    -- SQL Operations, read from database into array
    populate() RETURNS (BOOLEAN, STRING)
END INTERFACE

TYPE rowType INTERFACE
    -- Rules that relate to a whole database table
    can_update_row() RETURNS BOOLEAN,
    can_delete_row() RETURNS BOOLEAN,
    -- SQL Operations
    insert_row() RETURNS (BOOLEAN, STRING),
    update_row() RETURNS (BOOLEAN, STRING),
    delete_row() RETURNS (BOOLEAN, STRING),
    -- Validation
    valid_key() RETURNS (BOOLEAN, STRING),
    valid_row() RETURNS (BOOLEAN, STRING)
END INTERFACE

TYPE fieldType INTERFACE
    title() RETURNS STRING,
    -- Rules that relate to an individual field
    can_view_field() RETURNS BOOLEAN,
    can_edit_field() RETURNS BOOLEAN,
    
    default_value() RETURNS STRING,
    valid_value() RETURNS (BOOLEAN, STRING)
END INTERFACE

MAIN
DEFINE rec recordType
DEFINE row rowType
DEFINE FIELD fieldType

    LET field
END MAIN






