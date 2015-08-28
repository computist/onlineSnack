var host = "http://localhost:3000";

window.onload = function () {
	document.getElementById("login").onclick = loginclick;
	document.getElementById("logout").onclick = logoutclick;
	document.getElementById("getinfo").onclick = getinfo;
	document.getElementById("getdish").onclick = getdishclick;
	document.getElementById("spicy").onchange = function () {
		document.getElementById("spicy-value").innerHTML = document.getElementById("spicy").value;
	};
	document.getElementById("spicy-value").innerHTML = document.getElementById("spicy").value;
}

function loginclick () {
	var username = document.getElementById("username").value.trim(),
		password = document.getElementById("password").value;

	useAjax(host + "/login?username="+username+"&password="+password, login);
}

function logoutclick () {
	useAjax(host + "/logout", logout);
}

function getdishclick () {
	var table = document.getElementById("dishlist");
	var locations = document.getElementsByClassName("location");
	var locationstring = "";
	for(var i = 0; i < locations.length; i++) {
		if (locations[i].checked) {
			locationstring += locations[i].value + ",";
		}
	}
	locationstring = locationstring[locationstring.length-1] == "," ? locationstring.substring(0, locationstring.length-1) : locationstring;
	var spicy = document.getElementById("spicy").value;

	var sort_asc = "";
	var sortup = document.getElementsByClassName("sortup");
	for(var i = 0; i < sortup.length; i++) {
		if (sortup[i].checked) {
			sort_asc += sortup[i].value + ",";
		}
	}
	sort_asc = sort_asc[sort_asc.length-1] == "," ? sort_asc.substring(0, sort_asc.length-1) : sort_asc;


	var sort_desc = "";
	var sortdown = document.getElementsByClassName("sortdown");
	for(var i = 0; i < sortdown.length; i++) {
		if (sortdown[i].checked) {
			sort_desc += sortdown[i].value + ",";
		}
	}
	sort_desc = sort_desc[sort_desc.length-1] == "," ? sort_desc.substring(0, sort_desc.length-1) : sort_desc;

	while(table.rows[1]) table.deleteRow(1);

	var url = host + "/list?spicy=" + spicy;

	if (locationstring.length > 0) {
		url = url + "&location=" + locationstring;
	}

	if (sort_asc.length > 0) {
		url = url + "&sort_asc=" + sort_asc;
	}

	if (sort_desc.length > 0) {
		url = url + "&sort_desc=" + sort_desc;
	}

	var start_item = document.getElementById("start_item").value.trim(),
		end_item = document.getElementById("end_item").value.trim();
	if (start_item && end_item && start_item != "" && end_item != "") {
		url = url + "&start_item=" + start_item + "&end_item=" + end_item;
	}
	console.log(url);
	useAjax(url, getdish);
}

function useAjax(url, functionName){
	var ajax = new XMLHttpRequest();
	ajax.onload = functionName;
	ajax.open("GET", url, true);
	ajax.send();
}

function login () {
	if (this.status == 200) { // request successful
		var json = JSON.parse(this.responseText);
		document.getElementById("loginmessage").innerHTML = json.status;			
	} else { // request failed
		error(this);
	}
	
}


function logout () {
	if (this.status == 200) { // request successful
		var json = JSON.parse(this.responseText);
		document.getElementById("loginmessage").innerHTML = json.status;			
	} else { // request failed
		error(this);
	}
	
}

function getinfo () {
	useAjax(host, getmessage);
}

function getmessage () {
	if (this.status == 200) { // request successful
		document.getElementById("message").innerHTML = this.responseText;			
	} else { // request failed
		error(this);
	}
}

function getdish () {
	if (this.status == 200) { // request successful
		var json = JSON.parse(this.responseText);
		var dishlist = document.getElementById("dishlist");
		for (var i = 0; i < json.length; i++){
			var tr = document.createElement("tr");
			var td1 = document.createElement("td");
			td1.textContent = json[i].name;
			tr.appendChild(td1);
			var td2 = document.createElement("td");
			td2.textContent = json[i].location;
			tr.appendChild(td2);
			var td3 = document.createElement("td");
			td3.textContent = json[i].spicy;
			tr.appendChild(td3);
			var td4 = document.createElement("td");
			td4.textContent = json[i].rate;
			tr.appendChild(td4);

			var td5 = document.createElement("td");
			td5.textContent = json[i].rate_number;
			tr.appendChild(td5);

			dishlist.appendChild(tr);
		}
		//document.getElementById("message").innerHTML = this.responseText;			
	} else { // request failed
		error(this);
	}
}


