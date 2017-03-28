//Float Script v1.0 by Shady Abou-Zahra
//  please read the documentation for information about usage

function floatLayerAt(LayerName,X,Y) {
  var myLayer;
  if(document.layers) {
    myLayer=eval("document."+LayerName);
	if(myLayer!=null) {
      myLayer.pageX=eval(window.pageXOffset+X);
      myLayer.pageY=eval(window.pageYOffset+Y);
	}
  } else {
    myLayer=eval("document.all."+LayerName);
	if(myLayer!=null) {
      myLayer.style.top=eval(document.body.scrollTop+Y);
      myLayer.style.left=eval(document.body.scrollLeft+X);
	}
  }
  setTimeout("floatLayerAt(\'"+LayerName+"\',"+X+","+Y+")",1);
}
