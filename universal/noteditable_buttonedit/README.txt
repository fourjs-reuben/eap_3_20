This example shows the use of a BUTTONEDIT with NOTEDITABLE attribute as
a GUI pattern that can be used to display a numerical value and invite the user 
to drilldown for further details.

Key elements in the form are ...

BUTTONEDIT formonly.field1, ACTION=drill, IMAGE="fa-chevron-right", TITLE="Line 1";

and to drill down in an INPUT statement

ON ACTION drill INFIELD field1 