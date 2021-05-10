package shorturl

class Link {

    static constraints = {
        slug(display:false)
        url(url:true)
    }

    String url
    String slug

    static belongsTo = [user : User]

    static mapping = {
        sort(id: "desc")
    }
}
