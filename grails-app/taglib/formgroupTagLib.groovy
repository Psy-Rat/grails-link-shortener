class FormGroupTagLib{
  static namespace = "form"
  
  def group = { attrs, body ->
    if (attrs.config) {
      attrs = attrs.config
    }

    out << """
    <div class="form-group">
      <label for="${attrs.name}">${attrs.label}</label>
      <input type="${attrs.type ?: 'text'}" class="form-control" name="${attrs.name}" id="${attrs.name}" placeholder="${attrs.placeholder}">
      ${body()}
    </div>
    """
  }

  def nav = { attrs, body ->
    if (attrs.config) {
      attrs = attrs.config
    }

    out << """
    <button type="submit" class="btn btn-primary">${attrs.label}</button>
    <a class="btn btn-outline" href="${attrs.link}">${attrs.cancel}</a>
    """
  }
}
  
  
