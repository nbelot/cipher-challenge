<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main2"/>
    <title></title>
</head>

<body>
<div class="container">
    <g:uploadForm name="myUpload" action="uploadFiles">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label" for="encrypted">Encrypted file:</label>
                    <input type="file" name="encrypted" id="encrypted"/>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label" for="plain">Encrypted file:</label>
                    <input type="file" name="plain" id="plain" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <g:submitButton name="submit" class="btn btn-primary" value="Decrypt"/>
            </div>
        </div>
    </g:uploadForm>
</div>
</body>
</html>