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
                <div class="col-md-6 col-md-offset-3">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="form-group">
                                <label class="control-label" for="encrypted">Encrypted file:</label>
                                <input type="file" name="encrypted" id="encrypted" required/>
                            </div>
                            <div class="form-group">
                                <label class="control-label" for="plain">Encrypted file:</label>
                                <input type="file" name="plain" id="plain" required/>
                            </div>
                            <div class="col-md-12 text-center">
                                <g:submitButton name="submit" class="btn btn-primary" value="Decrypt"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </g:uploadForm>
    </div>
</body>
</html>