package cas

import org.apache.commons.lang.RandomStringUtils;
import grails.transaction.Transactional

@Transactional
class PasswordRandomizerService {

    def getRandomPass() {
        return(RandomStringUtils.random(8, true, true));
    }
}
