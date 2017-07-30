package cipher.challenge

import grails.transaction.Transactional

@Transactional
class TextService {
    def fileService

    def countLetters(multiPartFile) {
        FileReader fr = new FileReader(fileService.convert(multiPartFile));
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

        return sortByValue(letters).keySet().toArray()
    }

    def decryptText(encryptedText, encryptedLetterFreqArr, plainLetterFreqArr) {
        for(int i=0;i<plainLetterFreqArr.size();i++) {
            encryptedText = encryptedText.replace(encryptedLetterFreqArr[i], plainLetterFreqArr[i])
            encryptedText = encryptedText.replace(encryptedLetterFreqArr[i].toUpperCase(), plainLetterFreqArr[i].toUpperCase())
        }
        return encryptedText
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