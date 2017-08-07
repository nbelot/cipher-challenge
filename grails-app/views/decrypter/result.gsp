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
        $(document).ready(function() {

            $("#plain-letter-list").swappable({
                items:'.letter', // Mandatory option, class only.
                cursorAt: {top:-20},
                start : function(event, ui) {
                    $(ui.item[0]).index();
                },
                stop : function(event, ui) {
                    var encypted = $('#encrypted-letter-list li').map(function (index, element) {
                        return $(element).html()
                    }).toArray();
                    var plain = $('#plain-letter-list li').map(function (index, element) {
                        return $(element).html()
                    }).toArray();

                    $.ajax({
                        method: 'POST',
                        data: {
                            encrypted: encypted,
                            plain: plain
                        },
                        url: "/decrypter/order",
                        success: function (data) {
                            $("#decryption-container").empty();
                            $("#decryption-container").append(data);
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {

                        }
                    });
                }
                });
        });


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