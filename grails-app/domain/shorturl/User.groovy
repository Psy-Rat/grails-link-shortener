package shorturl

class User {
    def scaffold = true

    static constraints = {
        name(blank:false)
        password(display:true, password : true)
        email(blank:false, email:true, unique: true)
    }

    String name
    String password
    String email
    Date createdAt = new Date()

    static hasMany = [urls : Link]

    static mapping = {
        table 'test_users'
        urls (lazy: false, sort: 'id')
    }
}