$(document).ready(function() {
  var contents = $( ".slug-table .page-slug" ).contents();
	console.log( contents );
  $.each(contents, (index, value) => {
    console.log( value );
    value.data = window.location.origin + "/link/rd?lk=" + value.data.trim();
    console.log( value );
  })
});