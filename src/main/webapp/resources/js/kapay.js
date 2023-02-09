    function pay01(){
    	let w = '650';
		let h = '675';
		let xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft;
		let yPos = (document.body.offsetHeight/2) - (h/2);
		let popOption = "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		window.open("","pop",popOption);
		$("#location_host_gold").val(window.location.host);
		let form = document.payFormGold;
		form.target = "pop";
		form.action = "/payment/kapay01";
		
		form.submit();
    }
	
	

    function pay02(){
    	let w = '650';
		let h = '675';
		let xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft;
		let yPos = (document.body.offsetHeight/2) - (h/2);
		let popOption = "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		window.open("","pop",popOption);
		$("#location_host_silver").val(window.location.host);
		let form = document.payFormSilver;
		form.target = "pop";
		form.action = "/payment/kapay01";
		
		form.submit();
    }
    
    
    function pay03(){
    	let w = '650';
		let h = '675';
		let xPos = (document.body.offsetWidth/2) - (w/2);
		xPos += window.screenLeft;
		let yPos = (document.body.offsetHeight/2) - (h/2);
		let popOption = "width="+w+", height="+h+", left="+xPos+", top="+yPos+", menubar=yes, status=yes, titlebar=yes, resizable=yes";
		window.open("","pop",popOption);
		$("#location_host_bronze").val(window.location.host);
		let form = document.payFormBronze;
		form.target = "pop";
		form.action = "/payment/kapay01";
		
		form.submit();
    }