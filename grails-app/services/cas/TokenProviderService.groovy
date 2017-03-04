package cas

import grails.transaction.Transactional

import java.security.SecureRandom

@Transactional
class TokenProviderService {
    private SecureRandom random = new SecureRandom();

    def getToken() {
        return new BigInteger(130, random).toString(32);
    }
}
