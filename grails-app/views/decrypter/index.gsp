<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<meta name="layout" content="main2"/>
<head>
    <title></title>
</head>

<body>
<div class="container">
    <g:uploadForm name="myUpload" action="uploadFiles">
        <input type="file" name="encrypted" />
        <input type="file" name="plain" />
        <div>
            <g:submitButton name="submit"/>
        </div>
    </g:uploadForm>
</div>
</body>
</html>