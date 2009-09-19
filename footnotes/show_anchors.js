
var anchorTags = new Array();
var iframeSource = "/footnotes/add/";
anchorTags = "span,q,blockquote,em,pre".split(","); 

function showAnchors() {

    var button = document.getElementById("footnotesbutton");
    button.innerHTML = "Hide Anchors";
    button.href      ="javascript:hideAnchors()";

    for(i=0;i<anchorTags.length;i++) {
	var anchor = document.getElementsByTagName(anchorTags[i]);
	for(j = 0; j < anchor.length; j++) {
	    if(anchor[j].id.match("anchor")) {
		var tag = document.createElement('a');
		var noteId = anchor[j].id;
		noteId = noteId.replace("anchor","note");
		tag.id = noteId;
		tag.href = "javascript:openAnchor('" + anchor[j].id + "');";
		tag.setAttribute('style', 'text-color:rgb(100,100,110);');

		var text = document.createTextNode("*");
		tag.appendChild(text);
		anchor[j].appendChild(tag);
	    }
	}
    }
}

function hideAnchors() {

    var button = document.getElementById("footnotesbutton");
    button.innerHTML="Show Anchors";
    button.href      ="javascript:showAnchors()";

    for(i=0;i<anchorTags.length;i++) {
	var anchor = document.getElementsByTagName(anchorTags[i]);
	for(j = 0; j < anchor.length; j++) {
	    if(anchor[j].id.match("anchor")) {
		var noteId = anchor[j].id;
		noteId = noteId.replace("anchor","note");
		anchor[j].removeChild(document.getElementById(noteId));
	    }
	}
    }
}

function openAnchor(anchorId) {
    var element = document.getElementById(anchorId);
    var tag = document.createElement('div');
    tag.style.float="left";
    tag.style.border="1px solid";
    tag.style.width="90%";
    tag.style.height="310";
    tag.id=anchorId.replace("anchor","form");

    var sourceArguments = '?uri=http://sigfrid-lundberg.se/footnotes/' 
	+ '&'
	+ 'anchor=' + anchorId;

    tag.innerHTML = 
	'&nbsp;<a href="javascript:closeAnchor(\''
	+ anchorId 
	+'\')">close</a>'
	+ '<iframe name="open-anchor" src ="' 
	+ iframeSource + sourceArguments 
	+ '" frameborder="0" width="100%" height="290">'
	+ '<p>Your browser does not support iframes.</p>'
	+ '</iframe>';
    element.appendChild(tag);
    hideAnchors();
}

function closeAnchor(anchorId) {
    var formId  = anchorId.replace("anchor","form");
    var element = document.getElementById(anchorId);
    element.removeChild(document.getElementById(formId));
}

function printNotes(idArr,idTitles) {
    for(i=0;i<idArr.length;i++) {
	var nid= idArr[i];
	var seq = i+1;
	try {
	    var tag = document.createElement('sup');
	    var node = document.getElementById(nid);
	    tag.innerHTML = 
		'<a href="#note'+nid+'"'
		+'title="'+ idTitles[i] +'"'
		+'>'+seq+'</a>';
	    node.appendChild(tag);
	}
	catch(error) {}
    }
}

