<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>
        <g:layoutTitle default="Grails"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:link rel="icon" href="favicon.ico" type="image/x-ico"/>

    <asset:stylesheet src="application.css"/>

    <g:layoutHead/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-static-top" role="navigation">
    
    <g:if test="${session.user_id > 0}">
      <a class="btn btn-outline" href="/user/logout/">${message(code:'main.buttons.exit')}</a>
    </g:if>
    <g:else>
      <a class="btn btn-outline" href="/user/login/">${message(code:'main.buttons.login')}</a>
      <a class="btn btn-outline" href="/user/registration/">${message(code:'main.buttons.register')}</a>
    </g:else>
    
    
</nav>

<div class="container">
  <div class='row'>
    <g:layoutBody/>
  </div>
</div>

<div class="container-fluid footer fixed-bottom" role="contentinfo" >
  <div class="row" >
      <div class="col-12">
          footer
      </div>
  </div>
</div>
<asset:deferredScripts/>
</body>
</html>
