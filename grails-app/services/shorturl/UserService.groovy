package shorturl

import grails.gorm.transactions.Transactional

@Transactional
class UserService {

    def addUser(String email, String name, String password) {
        User user = new User(email: email, name:name, password:password.encodeAsSHA256())
        user.save()
        if (user.errors) {
            println user.errors
        }
        return user
    }

    def loginUser(String email, String password){
        User user = User.findByEmailAndPassword(email, password.encodeAsSHA256())
        if (user){
            return user.id
        }
        else {
            return -1;
        }
    }
}
