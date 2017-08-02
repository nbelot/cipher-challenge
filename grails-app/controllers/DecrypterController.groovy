

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
        def plainLetterFreqArr = params.get("plain[]")

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

    def private countLetters(uploadedPlainFile) {
        FileReader fr = new FileReader(convert(uploadedPlainFile));
        BufferedReader br = new BufferedReader(fr);

        SortedMap letters = new TreeMap()
        int c;
        while((c = br.read()) != -1) {
            char character = ((char) c).toLowerCase();
            if(Character.isLetter(character)) {
                if(!letters.containsKey(character)) {
                    letters.put(character, 1)
                } else {
                    letters.put(character, letters.get(character) + 1);
                }
            }
        }

        return sortByValue(letters)
    }

    def private convert(MultipartFile file) {
        File convFile = new File(file.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }

    def private sortByValue(Map unsortedMap) {
        Map sortedMap = new TreeMap(new ValueComparator(unsortedMap));
        sortedMap.putAll(unsortedMap);
        return sortedMap;
    }
}

class ValueComparator implements Comparator {
    Map map;

    public ValueComparator(Map map) {
        this.map = map;
    }

    public int compare(Object keyA, Object keyB) {
        Comparable valueA = (Comparable) map.get(keyA);
        Comparable valueB = (Comparable) map.get(keyB);
        return valueB.compareTo(valueA);
    }
}


