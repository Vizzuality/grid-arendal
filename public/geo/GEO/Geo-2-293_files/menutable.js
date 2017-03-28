function GetLangMenu(whichLang) {
var ImgDir = "/res/templates/v1.0/images/"
var ImgH = "20"
var w1, link1, img1, alt1;
var w2, link2, img2, alt2;
var w3, link3, img3, alt3;
var w4, link4, img4, alt4;
var w5, link5, img5, alt5;
var w6, link6, img6, alt6;

if (whichLang == "en") {
	w1= "87"; link1= "/home/index.html"; img1= ImgDir+"sites.gif"; alt1= "Our Sites";
	w2= "55"; link2= "/newsroom/index.html"; img2= ImgDir+"news.gif"; alt2= "News";
	w3= "66"; link3= "/events/index.asp"; img3= ImgDir+"events.gif"; alt3= "Events";
	w4= "104"; link4= "/publications/index.html"; img4= ImgDir+"publications.gif"; alt4= "Publications";
	w5= "79"; link5= "/home/sitemap.html"; img5= ImgDir+"sitemap.gif"; alt5= "Site Map";
	w6= "70"; link6= "/aboutitu/index.html"; img6= ImgDir+"about.gif"; alt6= "About Us";
} 
else if (whichLang == "fr") {
	w1= "86"; link1= "/home/index-fr.html"; img1= ImgDir+"sites-fr.gif"; alt1= "Nos sites";
	w2= "89"; link2= "/newsroom/index-fr.html"; img2= ImgDir+"news-fr.gif"; alt2= "Actualités";
	w3= "106"; link3= "/events/index.asp?lang=fr"; img3= ImgDir+"events-fr.gif"; alt3= "Evénements";
	w4= "105"; link4= "/publications/index-fr.html"; img4= ImgDir+"publications-fr.gif"; alt4= "Publications";
	w5= "104"; link5= "/home/sitemap-fr.html"; img5= ImgDir+"sitemap-fr.gif"; alt5= "Plan du Site";
	w6= "65"; link6= "/aboutitu/index-fr.html"; img6= ImgDir+"about-fr.gif"; alt6= "Info UIT";
} 
else if (whichLang == "es") {
	w1= "126"; link1= "/home/index-es.html"; img1= ImgDir+"sites-es.gif"; alt1= "Nuestros sitios";
	w2= "74"; link2= "/newsroom/index-es.html"; img2= ImgDir+"news-es.gif"; alt2= "Noticias";
	w3= "75"; link3= "/events/index.asp?lang=es"; img3= ImgDir+"events-es.gif"; alt3= "Eventos";
	w4= "114"; link4= "/publications/index-es.html"; img4= ImgDir+"publications-es.gif"; alt4= "Publicaciones";
	w5= "55"; link5= "/home/sitemap-es.html"; img5= ImgDir+"sitemap-es.gif"; alt5= "Mapa";
	w6= "66"; link6= "/aboutitu/index-es.html"; img6= ImgDir+"about-es.gif"; alt6= "Info UIT";
} 

document.writeln("<table border='0' cellpadding='0' cellspacing='0'>");
document.writeln(' <tr>');
if (document.layers || document.all || document.getElementById) {
	document.writeln('  <td width="' + w1 + '"><a href="'+link1+'" onmouseover="popUp('+"'elMenu1',event)"+'" onmouseout="popDown('+"'elMenu1')"+'" class="itumenu"><img border="0" src="'+img1+'" alt="'+alt1+'" width="' + w1 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w2 + '"><a href="'+link2+'" onmouseover="popUp('+"'elMenu2',event)"+'" onmouseout="popDown('+"'elMenu2')"+'" class="itumenu"><img border="0" src="'+img2+'" alt="'+alt2+'" width="' + w2 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w3 + '"><a href="'+link3+'" onmouseover="popUp('+"'elMenu3',event)"+'" onmouseout="popDown('+"'elMenu3')"+'" class="itumenu"><img border="0" src="'+img3+'" alt="'+alt3+'" width="' + w3 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w4 + '"><a href="'+link4+'" onmouseover="popUp('+"'elMenu4',event)"+'" onmouseout="popDown('+"'elMenu4')"+'" class="itumenu"><img border="0" src="'+img4+'" alt="'+alt4+'" width="' + w4 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w5 + '"><a href="'+link5+'" onmouseover="popUp('+"'elMenu5',event)"+'" onmouseout="popDown('+"'elMenu5')"+'" class="itumenu"><img border="0" src="'+img5+'" alt="'+alt5+'" width="' + w5 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w6 + '"><a href="'+link6+'" onmouseover="popUp('+"'elMenu6',event)"+'" onmouseout="popDown('+"'elMenu6')"+'" class="itumenu"><img border="0" src="'+img6+'" alt="'+alt6+'" width="' + w6 + '" height="'+ImgH+'"></a></td>');
}
else {
	document.writeln('  <td width="' + w1 + '"><a href="'+link1+'"><img border="0" src="'+img1+'" alt="'+alt1+'" width="' + w1 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w2 + '"><a href="'+link2+'"><img border="0" src="'+img2+'" alt="'+alt2+'" width="' + w2 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w3 + '"><a href="'+link3+'"><img border="0" src="'+img3+'" alt="'+alt3+'" width="' + w3 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w4 + '"><a href="'+link4+'"><img border="0" src="'+img4+'" alt="'+alt4+'" width="' + w4 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w5 + '"><a href="'+link5+'"><img border="0" src="'+img5+'" alt="'+alt5+'" width="' + w5 + '" height="'+ImgH+'"></a></td>');
	document.writeln('  <td width="' + w6 + '"><a href="'+link6+'"><img border="0" src="'+img6+'" alt="'+alt6+'" width="' + w6 + '" height="'+ImgH+'"></a></td>');
}
document.writeln(' </tr>');
document.writeln('</table>');
}
