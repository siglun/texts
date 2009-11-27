
browsebycategory = 1;
browsebydate = 0;

function closeopen(elementId) {
    var list = document.getElementById(elementId);

    if(elementId == "browsebycategory") {
	var otherlist = document.getElementById("browsebydate");
	list.style.display="block";
	otherlist.style.display="none";
	browsebycategory = 0;
	browsebydate = 1;
    } else {
	var otherlist = document.getElementById("browsebycategory");
	list.style.display="block";
	otherlist.style.display="none";
	browsebycategory = 1;
	browsebydate = 0;
    }
}

