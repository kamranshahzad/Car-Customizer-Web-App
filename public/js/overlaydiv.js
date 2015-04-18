function closediv(){
	
 	document.body.removeChild(box);  
	document.body.removeChild(layer); 
	}

function overlaydiv(){

var width = document.body.scrollWidth;//documentElement
var height	=	eval(document.body.scrollHeight);
var top		=	(height - 400);// + 250;




var layer = document.createElement('div');
layer.style.zIndex = 2;
layer.id = 'layer';
layer.style.position = 'absolute';
layer.style.top = '0px';
layer.style.left = '0px';
layer.style.height =  height + 'px';//documentElement
layer.style.width = width + 'px';
layer.style.backgroundColor = 'black';
layer.style.opacity = '0.5';
layer.style.filter += ("progid:DXImageTransform.Microsoft.Alpha(opacity=60)");
document.body.appendChild(layer); 

//Next we add a div in the middle of the page on top of the semi-transparent layer.

var div = document.createElement('div');
div.style.zIndex = 3;
div.id = 'box';
div.style.position =(navigator.appName == 'Microsoft Internet Explorer') ? 'absolute' : 'fixed';//userAgent
div.style.top = (navigator.appName == 'Microsoft Internet Explorer') ? top : '250px';
div.style.height = '120px';
div.style.width = '540px';
div.style.left = (width / 2) - (540 / 2) + 'px'; 
div.style.backgroundColor = 'white';

document.body.appendChild(div); 

  

var sp = document.createElement('span');
sp.id	=	'preloaderSpan';
sp.innerHTML = 'html code here';
div.appendChild(sp);

}