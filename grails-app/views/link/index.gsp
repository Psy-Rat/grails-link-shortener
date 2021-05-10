<asset:javascript src="jquery-3.3.1.min.js"/>
<%-- <asset:javascript src="link.js"/> --%>
<asset:stylesheet href="bootstrap.css"/>

<g:if test="${params.success}" >
    <div class="alert alert-success" role="alert">
        SUCC YESS
    </div>
</g:if>



<div class = "container">
  <g:form name="LinkAdding" url="[controller:'link', action:'index']" action='post'>
    <div class="form-group">
      <label for="link">Your link</label>
      <input type="text" class="form-control" name="link" id="link" placeholder="Enter link">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </g:form>

  <table class="table slug-table">
    <thead class="thead-dark">
    </thead>
      <tr>
        <th> Link </th>
        <th colspan=3> Shorten </th>
      </tr>
      <%-- <g:each var="link" in="${ view_urls }">
      <tr>
        <td> ${ link.url } </td>
        <td class = "page-slug"><g:link url="['controller': 'link', 'action': 'rd', params: [lk: link.slug]]" >${link.slug}</g:link></td>
        <td> <a class="btn btn-danger" href="/link/delete?slug=${ link.slug }" formmethod="post">Delete</a> </td>
      </tr>
      </g:each> --%>
  </table>
</div>

<asset:script type="text/javascript">
  function getSlugFullUrl(slug){
    return window.origin + '/link/rd/?lk=' + slug.trim()
  }

  function deleteUrl(id){
    $.ajax({
      url: "/link/delete?id="+id,
      type: 'POST',
      complete: function(e) {
        $('a[onClick="deleteUrl('+id+')"]').parent().parent().remove()
      }
      })
  };

  function addUrl(url) {
      var tr = $('<tr></tr>')
      tr.append( $('<td></td>').html(url.url) )
      var fullPath = getSlugFullUrl(url.slug)
      tr.append( $('<td></td>').html( fullPath ) )
      tr.append( $('<td></td>').html('<a class="btn btn-primary" href='+fullPath+' formmethod="post">GoTo</a>') )
      tr.append( $('<td></td>').html('<a class="btn btn-danger" onClick="deleteUrl('+url.id+')" formmethod="post">Delete</a>') )
      $( ".slug-table" ).append(tr)
  }



  var url = "${createLink(controller: 'link', action: 'getShortLinks')}"

  $(document).ready(function() {
    $.ajax({
      url: url,
      type: 'GET',
      complete: function(e) {
        var urls = e.responseJSON.urls
        for (url of urls) {
         addUrl(url)
        }
      }
    })

    
  });
</asset:script>