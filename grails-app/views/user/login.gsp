<asset:stylesheet href="bootstrap.css"/>
<div class = "container">
  <g:if test="${params.loginError}" >
    <div class="alert alert-danger" role="alert">
        Hey buddy, I think you've got the wrong door, the leather club's two blocks down.
    </div>
  </g:if>
  <g:form name="RegistrationForm" url="[controller:'user',action:'loginUser']" action='post'>
    <div class="form-group">
      <label for="inputEmail">Email address</label>
      <input type="email" class="form-control" name="inputEmail" id="inputEmail" aria-describedby="emailHelp" placeholder="Enter email">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </div>

    <div class="form-group">
      <label for="inputPassword">Password</label>
      <input type="password" class="form-control" name="inputPassword" id="inputPassword" placeholder="Password">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
    <a class="btn btn-outline" href="/user/registration/">Register</a>
  </g:form>
</div>