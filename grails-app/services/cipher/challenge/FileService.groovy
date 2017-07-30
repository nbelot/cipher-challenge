package cipher.challenge

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

@Transactional
class FileService {

    def getText(file) {
        return file.getFileItem().getString()
    }

    def convert(MultipartFile file) {
        File convFile = new File(file.getOriginalFilename());
        convFile.createNewFile();
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }
}
