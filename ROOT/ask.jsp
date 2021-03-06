<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.nutz.ngqa.Helpers" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" media="screen" href="./css/include/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="./css/application.css" />
<script type="text/javascript" src="./js/include/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="./js/include/jquery.json-2.3.min.js"></script>
<script type="text/javascript" src="./js/include/form2js.js"></script>
<script type="text/javascript" src="./js/include/jquery.pjax.js"></script>
<script type="text/javascript">
$(function() {
    $("#ask").click(function() {
        $.ajax({
        		type : 'POST',
        		url  : './ask',
        		data :  $.toJSON(form2js("ask-form")),
        		dataType : 'json',
        		success: function( data ) {
    						if (console && console.log){
      							console.log( 'Sample of data:', $.toJSON(data) );
    						}
    						if (data['ok']) { //添加成功
    							var nextURL = "./question/" + data['data']['id'];
    							window.location = nextURL;
    						} else {
    							alert('Fail ' + data['msg']);
    						}
  						}
        	});
    });
});
</script>
<title>Ask</title>
</head>
<body>
    <jsp:include page="_include_navbar.jsp" />
    <div class="container-fluid">
    <div class="row-fluid">
        <div class="span8 box">
            <form class="form-horizontal" id="ask-form">
                <fieldset>
                  <legend>Ask your ask</legend>
                  <div class="control-group">
                    <label class="control-label" for="title">Title</label>
                    <div class="controls">
                      <input type="text" class="input-xxlarge" id="title" name="title" placeholder="title">
                      <p class="help-block">Most input Title</p>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="tags">Tags</label>
                    <div class="controls">
                      <input type="text" class="input-xxlarge" id="tags" name="tags" placeholder="tags">
                      <p class="help-block">split by ","</p>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="content">Content</label>
                    <div class="controls">
                      <textarea class="input-xxlarge" id="content" name="content" rows="10" placeholder="content"></textarea>
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="format">Format</label>
                    <div class="controls">
                      <select id="format" name="format">
                        <option selected="selected" value="txt">Plain Text</option>
                        <option value="markdown">Markdown</option>
                      </select>
                    </div>
                  </div>
                  <div class="form-actions">
                    <button type="button" class="btn btn-primary" id="ask">Ask</button>
                    <button type="reset" class="btn">Cancel</button>
                  </div>
                </fieldset>
            </form>
        </div>
        <div class="span3" id="infos">
          <%= Helpers.getInfosHtml() %>
        </div>
    </div>
    <jsp:include page="_include_footer.jsp" />
    </div>
</body>
</html>
