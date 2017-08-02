<%--
  Created by IntelliJ IDEA.
  User: Nicolas Belot
  Date: 7/27/2017
  Time: 2:43 PM
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main2"/>
    <script>
        $( function() {
            $( "#plain-letter-list" ).sortable({
                revert: true,
                start: function(event, ui) {
                    var prevPos = ui.item.index();
                    ui.item.attr('previous-position', prevPos)

                },
                stop: function(event, ui) {
                    var currPos = ui.item.index();
                    var prevPos = ui.item.attr('previous-position');
                    var letter = ui.item.html();

                    $.ajax({
                        method: 'POST',
                        data : {
                            letter: letter,
                            prevPos: prevPos,
                            currPos: currPos
                        },
                        url : "/decrypter/order",
                        success: function (data) {
                            $("#decryption-container").empty();
                            $("#decryption-container").append(data);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {

                        }
                    });
                }
            });
            $( "ul, li" ).disableSelection();
        } );
    </script>
</head>

<body>
    <div class="container">
        <div id="decryption-container" class="row">
            <tmpl:decrypted />
        </div>
    </div>
</body>
</html>