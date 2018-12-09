This example illustrates the various ways that ERROR/MESSAGE can be displayed.

Key points.

Modal Error illustrates the display of an error before bringing up a modal 
window that allows user to select the correct value from a list.  You typically
see this with a BUTTONEDIT where entering the wrong value in the BUTTONEDIT
will bring up a DISPLAY ARRAY that allows the user to select a valid value, as 
if the user had clicked on the BUTTONEDIT value themselves.  Key thing to note
with this is that the ERROR message is displayed in the parent window as this is
where the field that caused the error is located.  It should not be displayed in
the modal window.

Error (big) shows a very very long error message

Error (multiline) shows an error message with a \n

Error(red) renders the error so that it stands out from MESSAGE

The FGL_WINMESSAGE examples show the 4 different type of FGL_WINMESSAGE dialogs

statusbar and popup illustrate the rendering of an error with these presentaiton
styles

lines3 is one of many ways that the statusbar can be rendered.  It is a popular
way as it allows the user to see all or ERROR, MESSAGE, and COMMENT



