<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../../resources/image/Exercise.svg" rel="shortcut icon" type="image/x-icon">
<link href="../../resources/css/styles.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<title>DDarawaZoom</title>

<!-- navigation -->
<nav class="navbar navbar-expand-lg navbar-light bg-light mb-3">
	<div class="container-fluid mx-5" > 
	    <a class="navbar-brand" href="/ddarawazoom">
	    	<img class="bi me-2" width="40" height="32" src="../../resources/image/Exercise.svg"/>
	    	DDarawaZoom!
    	</a>
	    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
	      	<span class="navbar-toggler-icon"></span>
	    </button>
    
	    <div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 position-absolute top-50 start-50 translate-middle">
				<li class="nav-item px-4">
					<a class="nav-link active" aria-current="page" href="/ddarawazoom/zoom">Zoom 강의</a>
		        </li>
		        
		        <li class="nav-item px-4">
					<a class="nav-link active" href="/ddarawazoom/vod">Vod 강의</a>
		        </li>
		     </ul>
		        
	        <ul class="navbar-nav me-auto mb-2 mb-lg-0 position-absolute top-50 translate-middle-y">
	        	<li class="nav-item">
					<a class="nav-link" href="/ddarawazoom/login">로그인</a>
		        </li>
		        <li class="nav-item dropdown ">
		          	<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            	회원 가입
		          	</a>
					<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
			            <li><a class="dropdown-item" href="#">멤버 가입</a></li>
			            <li><a class="dropdown-item" href="#">코치 지원</a></li>
			            <li><hr class="dropdown-divider"></li>
			            <li><a class="dropdown-item" href="#">Something else here</a></li>
		          	</ul>
		        </li>        
		   	</ul>

    	</div>
    
	</div>
</nav>

<!-- Channel Plugin Scripts -->
<!-- 1:1 문의 채팅 -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "69f689a1-6573-44cf-a860-c97af8f3f6e3"
  });
</script>
<!-- End Channel Plugin -->