	www = "";
	u = window.document.URL;
	w = 7;
	while (w < u.lastIndexOf('.')) {
		www = www + u.charAt(w);
		w++
	}
	i = 0;
	pageName = "";
	vEnd = www.length;
	vStart = -1;
	vLevel = 1;
	aLinks = new Array();
	
	while (i < www.length && vEnd != -1) {								
		vEnd = www.indexOf('/', vStart+1);
		
		n = vStart + 1
		page = "";
		if (vEnd == -1) {
			while (n < u.lastIndexOf('.')) {
				page = page + www.charAt(n);	
				n++
			}	
		}
		else{
			while (n < vEnd) {
				page = page + www.charAt(n);	
				n++
			}	
		}
		aLinks[i] = page;
		vStart = vEnd;
		
		i++;
		vLevel = vLevel + 1;									
		}	
		//section helps define article page links
		section = (aLinks[vLevel-3])
		section1 = (aLinks[vLevel-4])
		
		aEllipse = new Array();	
		aEllipse[aLinks.length -1] = "";
		aEllipse[aLinks.length] = "";
		e = aLinks.length -4;
		//alert(aLinks.length);
		steps = "";
		//while (e > -1) {
		//	steps = steps + "../";
		//	aEllipse[e] = steps;
		//	e = e-1;
		//	}
		//change the following number when going live to reflect the root directory
		s = 3;
		while (s < aLinks.length) {
			steps = steps + "../";
			//aEllipse[e] = steps;
			//e = e-1;
			s++;
			}
		
		//vEllipse = (aEllipse.join(""));
		vEllipse = (steps);
		//alert(vEllipse);
		
		