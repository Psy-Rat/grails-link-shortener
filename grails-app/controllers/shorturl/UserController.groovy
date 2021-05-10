package shorturl

class UserController {
    static layout = 'base'
    static scaffold  = User

    def userService

    static allowedMethods = {
        index : ['POST', 'GET']
        addUser: 'POST'
        loginUser: 'POST'
    }

    def login() {
        
    }

    def registration() {

    }

    def logout(){
        session.is_valid = false
        session.user_id = 0
        redirect(controller:"User", action:"login")
    }

    def addUser() {
        def user = userService.addUser(params.inputEmail, params.inputName, params.inputPassword)
        // respond ([user: user], formats: ['json'])
        // ToDo check on shiiiieeeet
        redirect(action: "login")
    }

    def loginUser(){
        Integer res = userService.loginUser(params.inputEmail, params.inputPassword)
        if (res > 0) {
            session.is_valid = true
            session.user_id = res
            redirect(controller:"Link", action:"index")
        }
        else {
            session.is_valid = false
            session.user_id = 0
            // respond ([result: res], formats: ['json'])
            redirect(controller:"User", action:"login", params: [loginError: true])
        }

    }


}
