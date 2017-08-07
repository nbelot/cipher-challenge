<asset:javascript src="order-table.js"/>

<div class="col-md-5">
    <label class="control-label">Encrypted text</label>
    <g:each in="${encryptedText.split('\n')}" var="paragraph">
        <p>${paragraph.trim()}</p>
    </g:each>
</div>
<div class="col-md-1 text-center">
    <label class="control-label">Encrypted letter</label>
    <ul id="encrypted-letter-list">
        <g:each in="${encryptedLetterFreq}" var="encryptedLetter">
            <li>${encryptedLetter}</li>
        </g:each>
    </ul>
</div>
<div class="col-md-1 text-center">
    <label class="control-label">Decrypted letter</label>
    <ul id="plain-letter-list">
        <g:each in="${plainLetterFreq}" var="plainLetter" status="i">
            <li class="letter" position="${i}">${plainLetter}</li>
        </g:each>
    </ul>
</div>
<div class="col-md-5">
    <label class="control-label">Decrypted text</label>
    <g:each in="${decryptedText.split('\n')}" var="paragraph">
        <p>${paragraph.trim()}</p>
    </g:each>
</div>