<g:set var='emailConfig' value="${[label:'Email address', name:'inputEmail',    placeholder: 'Enter email', type: 'email'   ]}" />
<g:set var='passConfig'  value="${[label:'Password',      name:'inputPassword', placeholder: 'Password',    type:'password' ]}" />
<g:set var='nameConfig'  value="${[label:'User name',     name:'inputName',     placeholder: 'Your Name']}" />

<g:set var='okConfig' value="${[label: message(code:'main.buttons.submit'),     link:'/user/login/',     cancel: message(code:'main.buttons.cancel')]}" />

<asset:stylesheet href="bootstrap.css"/>
<div class = "container">
  <g:form name="RegistrationForm" url="[controller:'user',action:'addUser']" action='post'>

    <form:group config="${emailConfig}">
      <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
    </form:group>

    <form:group config="${nameConfig}">
      <small id="emailHelp" class="form-text text-muted">♂ Get your ass back here ♂</small>
    </form:group>

    <form:group config="${passConfig}">
    </form:group>

    <form:nav config = "${okConfig}"/>
  </g:form>
</div>