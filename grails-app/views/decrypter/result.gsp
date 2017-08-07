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
</head>

<body>
    <div class="container">
        <h4>Please, adjust the decryption accuracy. Order the column <strong>"Decrypted letter"</strong> if needed by swapping letters</h4>
        <div id="decryption-container" class="row">
            <tmpl:decrypted />
        </div>
    </div>
</body>
</html>