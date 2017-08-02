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
    <g:each in="${decryptedText.split('\n')}" var="paragraph">
        <p>${paragraph.trim()}</p>
    </g:each>
</div>