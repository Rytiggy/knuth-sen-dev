package cas

import grails.transaction.Transactional
import java.nio.charset.Charset;
import java.security.MessageDigest;

@Transactional
class Md5passService {

    def getEncryptedPass(String pass) {
        MessageDigest md = MessageDigest.getInstance("MD5");

        md.update(pass.getBytes(Charset.forName("UTF-8")));

        byte[] mdbytes = md.digest();

        //convert the byte to hex format method 1
        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < mdbytes.length; i++) {
            sb.append(Integer.toString((mdbytes[i] & 0xff) + 0x100, 16).substring(1));
        }

        return sb.toString();
    }
}
