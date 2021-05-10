package shorturl

import grails.gorm.transactions.Transactional

@Transactional
class LinkService {
    static Random random = new Random()
    String availableSimbols = "0123456789qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM-_~" 

    def random_slug(User user, Integer len = 11) {
        String slug = user.name.encodeAsSHA256()[0..2]
        slug += Double.toHexString( Math.random() ).substring(4).substring(0, len - 3).toUpperCase()
        // for(Integer i = 0; i < len - 1; i++ ){
        //     slug = slug + availableSimbols[random.nextInt(availableSimbols.length())]
        // }
        return slug

    }

    def deleteLink(Integer link_id) {
        Link link = Link.get(link_id)
        link.delete()
    }

    def addLink(Integer user_id, String url) {
        User user = User.get(user_id)
        if (!user) {
            return null
        }
        Integer max_len = 11
        String slug = random_slug(user, max_len)
        
        while( getLinkBySlug(slug) ) {
            slug = random_slug(user, max_len++)
        }
    
        Link link = new Link(url: url, slug:slug)
        user.addToUrls(link)
        // link.save() Не нужен! )
        return link
    }

    def getUserLinks(Integer user_id){
        def urls = User.get(user_id).urls
        return urls
    }

    def getLinkBySlug(String slug){
        def link = Link.find("from Link as l where l.slug=?", [slug])
        return link
    }
}
