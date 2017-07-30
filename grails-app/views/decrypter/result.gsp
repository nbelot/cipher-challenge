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
                stop: function( event, ui ) {
                    var encypted = $('#encrypted-letter-list li').map(function(index, element) {return $(element).html()}).toArray();
                    var plain = $('#plain-letter-list li').map(function(index, element) {return $(element).html()}).toArray();
                    $.ajax({
                        type : "POST",
                        url : "/decrypter/order",
                        data : {
                            encrypted: encypted,
                            plain: plain
                        },
                        complete: function(){
                            console.log('success')
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
        <div class="row">
            <div class="col-md-5">
                <g:each in="${encryptedText.split('\n')}" var="paragraph">
                    <p>${paragraph.trim()}</p>
                </g:each>
            </div>
            <div class="col-md-1">
                <ul id="encrypted-letter-list">
                    <g:each in="${encryptedLetterFreq}" var="encryptedLetter">
                        <li>${encryptedLetter}</li>
                    </g:each>
                </ul>
            </div>
            <div class="col-md-1">
                <ul id="plain-letter-list">
                    <g:each in="${plainLetterFreq}" var="plainLetter" status="i">
                        <li position="${i}">${plainLetter}</li>
                    </g:each>
                </ul>
            </div>
            <div class="col-md-5">
                <g:each in="${plainText.split('\n')}" var="paragraph">
                    <p>${paragraph.trim()}</p>
                </g:each>
            </div>
        </div>
    </div>
</body>
</html>