

import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.commons.CommonsMultipartFile

class DecrypterController {
    def textService
    def fileService

    def encryptedText
    def decryptedText
    def plainText
    def encryptedLetterFreqArr
    def plainLetterFreqArr
    def plainLetterFreqDefault = ['e','t','a','o','i','n','s','h','r','d','l','u','c','m','w','f','y','g','p','b','v','k','x','j','q','z']

    def index() { }

    def uploadFiles() {
        def uploadedEncryptedFile = request.getFile('encrypted')
        def uploadedPlainFile = request.getFile('plain')

        encryptedText = fileService.getText(uploadedEncryptedFile)
        plainText = fileService.getText(uploadedPlainFile)

        plainLetterFreqArr= textService.countLetters(uploadedPlainFile)
        encryptedLetterFreqArr= textService.countLetters(uploadedEncryptedFile)

        decryptedText = textService.decryptText(encryptedText, encryptedLetterFreqArr, plainLetterFreqArr)

        render view: 'result', model: createModel()
    }

    def order() {
        plainLetterFreqArr = params.get("plain[]")

        decryptedText = textService.decryptText(encryptedText, encryptedLetterFreqArr, plainLetterFreqArr)

        render view: 'result', model: createModel()
    }

    def createModel() {
        def model = [:]
        model.encryptedText = encryptedText
        model.decryptedText = decryptedText
        model.encryptedLetterFreq = encryptedLetterFreqArr
        model.plainLetterFreq = plainLetterFreqArr
        return model
    }
}



