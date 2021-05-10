package shorturl

class LinkController {
    static layout = 'base'


    static allowedMethods = {
        index : ['POST', 'GET']
        rd: ['POST']
        delete: ['POST']
        getShortLinks: ['GET']
    }

    def linkService

    def delete(){
        if (!session.is_valid){
                redirect(controller:'user', action:'login', params: [loginError: true])   
        }
        
        linkService.deleteLink(params.id as Integer)
    }

    def rd(){
        def link = linkService.getLinkBySlug(params.lk)
        if (link) {
            redirect(url: link.url)
        }
        else{
            respond ([attrs: params, result : 404], formats: ['json'])
        }
    }

    def getShortLinks() {
        def user_id = session.user_id ?: 0
        if ( user_id ){
            def urls = linkService.getUserLinks(user_id)
            respond ([urls : urls], formats: ['json'])
        } else {
            respond ([urls : 'error'], formats: ['json']) // todo: 404
        }
        
    }

    def index() {
        def is_valid = session.is_valid ?: false
        def user_id = session.user_id ?: 0


        if ( !is_valid || !user_id ){
            return redirect(controller:'user', action:'login', params: [loginError: true])
        }

        if (request.method == 'POST') {
            def result = linkService.addLink(session.user_id, params.link)
            if (result){
                return redirect(controller:'link', action:'index', params: [success: true])
            }
            else{
                respond ([result: result], formats: ['json'])
            }
        }
        
        def urls = linkService.getUserLinks(user_id)
        respond ([view_urls : urls])
        // if request method is 'GET' -> Just render the page 
    }
}
