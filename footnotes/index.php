<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>Add footnotes to my pages -- a prototype text annotation
  interface: 
	  Sigfrid Lundberg's Stuff
	</title>
    <link href="http://feeds.feedburner.com/SigfridLundbergsStuff?format=xml" type="application/atom+xml" title="Sigfrid Lundberg's Stuff" rel="alternate"/>
    <link href="http://sigfridlundbergsstuff.disqus.com/latest.rss" type="application/rss+xml" title="Latest Comments" rel="alternate"/>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <script src="/js/navigation.js" type="text/javascript"> 
	  </script>
    <?php 
	  
	   $uri = "http://sigfridlundbergsstuff.disqus.com/latest.rss";
	   $handle = @fopen($uri, "r");
	   $doc  = "";
	   if ($handle) {
              while (!feof($handle)) {
		   $buffer = fgets($handle, 4096);
		   $doc .= $buffer;
	      }
              fclose($handle);
           }
	   $domdoc = DOMDocument::loadXML($doc);
	  
	?>
    <script type="text/javascript" src="show_anchors.js">
	  </script>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
    <link rel="stylesheet" href="/css-style/html.css"/>
  </head>
  <body>
    <div class="left_box">
      <div style="text-align:left;width=90%;">
        <?php 
      
      $file1 = "/home/s/sigfrid/www/div_top_left_box.xml";
      $file2 = "/home/sigge/fsdata/div_top_left_box.xml";
      if (file_exists($file1)) {
         readfile($file1);
      } elseif (file_exists($file2)) {
         readfile($file2);
      }
      
    ?>
      </div>
      <div style="text-align:left;width=90%;">
        <p>
          <a href="/">Home</a>
          <br/>
          <a href="http://feeds.feedburner.com/SigfridLundbergsStuff?format=xml" type="application/atom+xml" class="feed-link"><img src="/images/Newsfeed-Atom.png" alt="Subscribe to Stuff from Sigfrid Lundberg" border="0"/>Subscribe to my stuff</a>
          <br/>
          <a href="http://sigfridlundbergsstuff.disqus.com/latest.rss" type="application/rss+xml" class="feed-link"><img src="/images/Newsfeed-Atom.png" alt="Subscribe to Stuff from Sigfrid Lundberg" border="0"/>Subscribe to discussion feed</a>
        </p>
        <?php 
      
      $file1 = "/home/s/sigfrid/www/subjects.xml";
      $file2 = "/home/sigge/fsdata/subjects.xml";
      if (file_exists($file1)) {
         readfile($file1);
      } elseif (file_exists($file2)) {
         readfile($file2);
      }
      
    ?>
        <?php 
      
      $file1 = "/home/s/sigfrid/www/me.xml";
      $file2 = "/home/sigge/fsdata/me.xml";
      if (file_exists($file1)) {
         readfile($file1);
      } elseif (file_exists($file2)) {
         readfile($file2);
      }
      
    ?>
      </div>
    </div>
    <div class="right_box">
      <h1 style="font-family: sans-serif; width: 55%; float: left;text-align: left;">Add footnotes to my pages -- a prototype text annotation
  interface</h1>
      <p style="width: 38%; float: left;text-align: right"><em><strong>Sigfrid Lundberg's Stuff 2009-09-09</strong></em><br/><br/><a id="footnotesbutton" href="javascript:showAnchors();">Show Anchors</a> 
	    ||
	    <a class="addthis_button" href="http://www.addthis.com/bookmark.php?v=250&amp;pub=siggelundberg"><img src="http://s7.addthis.com/static/btn/v2/lg-share-en.gif" width="125" height="16" alt="Bookmark and Share" style="border:0"/></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js?pub=siggelundberg">
		</script></p>
      <div style="clear:both">
	    </div>
      <div>
        <p id="anchor54186a1">
    <span id="anchor54124b10.84018771715471">There</span>
    <span id="anchor54128b20.394382926819093">is</span>
    <span id="anchor54130b30.783099223758606">a</span>
    <span id="anchor54132b40.798440033476073">link</span>
    <span id="anchor54135b50.911647357936784">at</span>
    <span id="anchor54362b60.197551369293384">the</span>
    <span id="anchor54365b70.335222755714889">top</span>
    <span id="anchor54367b80.768229594811904">of</span>
    <span id="anchor54369b90.277774710803188">this</span>
    <span id="anchor54372b100.553969955795431">page.</span>
    <span id="anchor54374b110.47739705186216">It</span>
    <span id="anchor54378b120.628870924761924">says</span>
    <span id="anchor54380b130.364784472791843">"Show</span>
    <span id="anchor54382b140.513400910195616">anchors".</span>
    <span id="anchor54384b150.952229725174713">It's</span>
    <span id="anchor54387b160.916195068003701">not</span>
    <span id="anchor54389b170.635711727959901">a</span>
    <span id="anchor54392b180.717296929432683">very</span>
    <span id="anchor54394b190.141602555355803">user</span>
    <span id="anchor54396b200.606968876257059">friendly</span>
    <span id="anchor54399b210.0163005716243296">description</span>
    <span id="anchor54377b220.242886770629737">of</span>
    <span id="anchor54405b230.137231576786019">what</span>
    <span id="anchor54408b240.80417675422699">it</span>
    <span id="anchor54410b250.156679089254085">does,</span>
    <span id="anchor54412b260.400944394246183">but</span>
    <span id="anchor54415b270.129790446781456">I</span>
    <span id="anchor54417b280.108808802025769">cannot</span>
    <span id="anchor54420b290.998924518003559">figure</span>
    <span id="anchor54422b300.218256905310907">out</span>
    <span id="anchor54424b310.512932394404398">a</span>
    <span id="anchor54427b320.839112234692607">better</span>
    <span id="anchor54429b330.612639832595661">term</span>
    <span id="anchor54432b340.296031617697343">right</span>
    <span id="anchor54434b350.637552267703019">now.</span>
    <span id="anchor54436b360.524287190066784">If</span>
    <span id="anchor54439b370.493582986990727">you</span>
    <span id="anchor54441b380.97277502388357">click</span>
    <span id="anchor54444b390.292516784413027">on</span>
    <span id="anchor54446b400.771357697793915">it,</span>
    <span id="anchor54448b410.526744979213339">there</span>
    <span id="anchor54401b420.769913836275187">will</span>
    <span id="anchor54456b430.400228622090178">appear</span>
    <span id="anchor54458b440.891529452005182">a</span>
    <span id="anchor54461b450.283314746005142">link</span>
    <span id="anchor54463b460.352458347264891">after</span>
    <span id="anchor54466b470.807724520008883">most</span>
    <span id="anchor54468b480.919026473965042">words</span>
    <span id="anchor54470b490.0697552762319126">in</span>
    <span id="anchor54473b500.949327075364686">the</span>
    <span id="anchor54475b510.525995350222101">text.</span>
    <span id="anchor54478b520.0860558478562421">These</span>
    <span id="anchor54480b530.192213845994423">are</span>
    <span id="anchor54482b540.66322692700812">the</span>
    <span id="anchor54485b550.890232602548894">annotation</span>
    <span id="anchor54487b560.348892935248508">anchors.</span></p>
        <p id="anchor54192a2">
    <span id="anchor54124b10.0641713207886421">When</span>
    <span id="anchor54129b20.0200230488646883">visible,</span>
    <span id="anchor54131b30.457701737274277">the</span>
    <span id="anchor54134b40.0630958383265398">anchors</span>
    <span id="anchor54361b50.238279954175595">appears</span>
    <span id="anchor54364b60.970634131678675">as</span>
    <span id="anchor54366b70.902208073484808">a</span>
    <span id="anchor54369b80.850919786771256">clickable</span>
    <span id="anchor54371b90.266665749376018">asterisk</span>
    <span id="anchor54373b100.539760340722166">'*',</span>
    <span id="anchor54378b110.375206976372379">and</span>
    <span id="anchor54382b120.760248736366745">click</span>
    <span id="anchor54384b130.512535364140074">on</span>
    <span id="anchor54386b140.667723760785406">one</span>
    <span id="anchor54389b150.53160643416066">of</span>
    <span id="anchor54391b160.0392803433534132">them</span>
    <span id="anchor54394b170.437637596594932">activates</span>
    <span id="anchor54396b180.931835056250838">the</span>
    <span id="anchor54398b190.930809795358595">usual</span> <a id="anchor54195d20.720952343065735" href="http://disqus.com">disqus.com forum</a>
    <span id="anchor54135b10.284293403050068">.</span>
    <span id="anchor54363b20.738534314901817">This</span>
    <span id="anchor54365b30.639978816565116">is</span>
    <span id="anchor54368b40.354048679747641">by</span>
    <span id="anchor54370b50.687861390266503">some</span>
    <span id="anchor54372b60.165974166321556">client</span>
    <span id="anchor54374b70.440104527603884">side</span>
    <span id="anchor54379b80.880075236260926">DOM</span>
    <span id="anchor54381b90.829201093329676">programming.</span></p>
        <p id="anchor54202a3">
    <span id="anchor54378b10.330337129687116">Submitting</span>
    <span id="anchor54364b20.228968171043772">a</span>
    <span id="anchor54366b30.893372414583979">footnote</span>
    <span id="anchor54368b40.350360178551804">works,</span>
    <span id="anchor54370b50.686669908318049">but</span>
    <span id="anchor54372b60.956468252910519">the</span>
    <span id="anchor54932b70.588640133193061">script</span>
    <span id="anchor54934b80.657304039531063">never</span>
    <span id="anchor54937b90.858676325929666">get</span>
    <span id="anchor54939b100.439559919498656">the</span>
    <span id="anchor54941b110.923969788907082">acknowledgement</span>
    <span id="anchor54945b120.398436666651832">from</span>
    <span id="anchor54947b130.814766896336697">the</span>
    <span id="anchor54949b140.684218525273827">disqus.com</span>
    <span id="anchor54951b150.910972030791907">server.</span>
    <span id="anchor54954b160.482490656656442">I</span>
    <span id="anchor54956b170.215824958968826">don't</span>
    <span id="anchor54958b180.95025237414532">know</span>
    <span id="anchor54961b190.920128253717035">why,</span>
    <span id="anchor54963b200.147660014754003">but</span>
    <span id="anchor54966b210.881062169503915">it</span>
    <span id="anchor54943b220.641080596317109">seems</span>
    <span id="anchor54972b230.431953418269732">that</span>
    <span id="anchor54974b240.619596483940071">the</span>
    <span id="anchor54977b250.281059412416564">form</span>
    <span id="anchor54979b260.786002098017373">doesn't</span>
    <span id="anchor54981b270.307457873740912">like</span>
    <span id="anchor54984b280.447033579203781">to</span>
    <span id="anchor54986b290.226106625155595">live</span>
    <span id="anchor54989b300.187533109536177">in</span>
    <span id="anchor54991b310.276234672067796">an</span>
    <span id="anchor54993b320.556443755308373">iframe.</span></p>
        <p id="anchor55576b680.592539918884886">
    <span id="anchor54964b10.416501280579949">My</span>
    <span id="anchor54974b20.169607086186114">server</span>
    <span id="anchor54977b30.906803933860177">retrieves</span>
    <span id="anchor54979b40.103171188432337">the</span>
    <span id="anchor54981b50.126075339096633">annotations</span>
    <span id="anchor54984b60.495444066587577">from</span>
    <span id="anchor54986b70.760475228429062">the</span>
    <span id="anchor54989b80.9847516650263">disqus.com</span>
    <span id="anchor54991b90.935003986551894">web</span>
    <span id="anchor54993b100.684445016870482">services</span>
    <span id="anchor54954b110.38318833121247">and</span>
    <span id="anchor54967b120.749770882422929">print</span>
    <span id="anchor54948b130.368663541678648">a</span>
    <span id="anchor54950b140.294160362004377">list</span>
    <span id="anchor54968b150.232261538613709">of</span>
    <span id="anchor54970b160.584488500647474">notes</span>
    <span id="anchor54972b170.244412735684036">at</span>
    <span id="anchor54933b180.152389791865083">the</span>
    <span id="anchor54936b190.732148515867138">end</span>
    <span id="anchor54938b200.12547490472229">of</span>
    <span id="anchor54940b210.793470388182192">the</span>
    <span id="anchor54942b220.164101933671209">page.</span>
    <span id="anchor54367b230.745071389128022">This</span>
    <span id="anchor54369b240.0745298005987563">is</span>
    <span id="anchor54371b250.950104031688582">done</span>
    <span id="anchor54373b260.0525292624032727">server</span>
    <span id="anchor55195b270.521563379802538">side,</span>
    <span id="anchor55197b280.176210656378516">shuch</span>
    <span id="anchor55199b290.240062372405111">that</span>
    <span id="anchor55201b300.797798051870334">the</span>
    <span id="anchor55204b310.732654411686889">discussions</span>
    <span id="anchor55206b320.65656365298506">within</span>
    <span id="anchor55208b330.96740513852211">the</span>
    <span id="anchor55210b340.639458345547066">footnotes</span>
    <span id="anchor55212b350.759734841883059">will</span>
    <span id="anchor55214b360.0934804771530817">be</span>
    <span id="anchor55216b370.134902411668982">visible</span>
    <span id="anchor55218b380.52021006984646">by</span>
    <span id="anchor55221b390.0782321417137199">search</span>
    <span id="anchor55223b400.0699063977552142">engines.</span>
    <span id="anchor55225b410.204655086251281">The</span>
    <span id="anchor54364b420.461420473391852">place</span>
    <span id="anchor55232b430.819677280178143">of</span>
    <span id="anchor55235b440.57331862839559">the</span>
    <span id="anchor55237b450.755580835396229">annotation</span>
    <span id="anchor55239b460.0519388187918527">is</span>
    <span id="anchor55241b470.157807128577403">marked</span>
    <span id="anchor55243b480.999993571080264">as</span>
    <span id="anchor55245b490.204328610656936">a</span>
    <span id="anchor55248b500.889955644444542">note</span>
    <span id="anchor55250b510.125468475802554">with</span>
    <span id="anchor55252b520.99779899930479">a</span>
    <span id="anchor55255b530.0540575776500896">link</span>
    <span id="anchor55257b540.870539864930576">to</span>
    <span id="anchor55260b550.0723287994378846">the</span>
    <span id="anchor55262b560.00416160887301043">notes.</span>
    <span id="anchor55264b570.923069127333848">You</span>
    <span id="anchor55267b580.593892179240422">may</span>
    <span id="anchor55269b590.180372265717188">read</span>
    <span id="anchor55272b600.163131499273298">the</span>
    <span id="anchor55274b610.391690230645095">annotation</span>
    <span id="anchor55276b620.913026677404077">when</span>
    <span id="anchor55279b630.81969515272402">your</span>
    <span id="anchor55281b640.359095368701543">mouse</span>
    <span id="anchor55284b650.552485022485482">is</span>
    <span id="anchor55286b660.579429994141418">over</span>
    <span id="anchor55288b670.452575845854625">the</span>
    <span id="anchor55291b680.687387434620125">link.</span></p>
        <p id="anchor54216a5">
    <span id="anchor54380b10.099640063522216">Is</span>
    <span id="anchor54967b20.530807988034006">this</span>
    <span id="anchor54969b30.757293832375339">a</span>
    <span id="anchor54971b40.304295149773497">good</span>
    <span id="anchor54948b50.992228461425858">idea?</span>
    <span id="anchor54950b60.576971112553482">Do</span>
    <span id="anchor54952b70.877613778169087">you</span>
    <span id="anchor54955b80.747809296356425">like</span>
    <span id="anchor54932b90.628909931345335">it?</span>
    <span id="anchor54934b100.0354209067464904">Should</span>
    <span id="anchor54937b110.747802866971028">all</span>
    <span id="anchor54940b120.833238542002271">my</span>
    <span id="anchor54363b130.925376551191032">pages</span>
    <span id="anchor54366b140.873271342773582">have</span>
    <span id="anchor54368b150.831037540841399">user</span>
    <span id="anchor54370b160.979434129306783">supplied</span>
    <span id="anchor54373b170.743811207238497">foot</span>
    <span id="anchor54974b180.903366340279284">notes?</span></p>
        <h2 id="anchor54220a6">
    <span id="anchor54965b10.983595738179794">How</span>
    <span id="anchor54968b20.666880334572345">is</span>
    <span id="anchor54970b30.497258519054045">it</span>
    <span id="anchor54972b40.16396800343132">done</span></h2>
        <p id="anchor55018b510.584488500647474">
    <span id="anchor54942b10.830011833845643">In</span>
    <span id="anchor54966b20.888948750164802">order</span>
    <span id="anchor54971b30.0769946808353973">to</span>
    <span id="anchor54363b40.649706986104002">add</span>
    <span id="anchor54365b50.248044118400684">footnotes</span>
    <span id="anchor54367b60.629479703320879">to</span>
    <span id="anchor54370b70.229136979779758">a</span>
    <span id="anchor54372b80.70061996472097">text,</span>
    <span id="anchor55687b90.316867137475343">we</span>
    <span id="anchor55690b100.328777043301974">need</span>
    <span id="anchor55692b110.231427952289315">to</span>
    <span id="anchor55695b120.0741609698506822">be</span>
    <span id="anchor55697b130.633072193541132">able</span>
    <span id="anchor55700b140.223656413249511">to</span>
    <span id="anchor55702b150.651132082404165">address</span>
    <span id="anchor55704b160.510685971244558">individual</span>
    <span id="anchor55706b170.971465709605937">positions</span>
    <span id="anchor55708b180.280042013283839">in</span>
    <span id="anchor55710b190.546106877991048">it.</span>
    <span id="anchor55712b200.719268576111304">These</span>
    <span id="anchor55714b210.113280554820448">positions</span>
    <span id="anchor55694b220.47148342918208">are</span>
    <span id="anchor55720b230.592539918884886">what</span>
    <span id="anchor55723b240.944318096127509">I'd</span>
    <span id="anchor55725b250.450917558023202">like</span>
    <span id="anchor55727b260.336351125657722">to</span>
    <span id="anchor55729b270.847684435941132">call</span>
    <span id="anchor55731b280.434513295737334">annotation</span>
    <span id="anchor55734b290.00323145976440583">anchors.</span>
    <span id="anchor55736b300.344942954995177">I've</span>
    <span id="anchor55738b310.598481299634316">already</span>
    <span id="anchor55741b320.83324329407571">briefly</span>
    <span id="anchor55743b330.233891704694318">discussed</span>
    <span id="anchor55746b340.675475980469713">the</span>
    <span id="anchor55748b350.482950279714051">problem</span>
    <span id="anchor55750b360.481935823095001">on</span>
    <span id="anchor55753b370.304955683324931">how</span>
    <span id="anchor55755b380.71208725995947">to</span>
    <span id="anchor55758b390.18255578735031">create</span>
    <span id="anchor55760b400.621822821265935">identifiers</span>
    <span id="anchor55762b410.0408643027957828">(see</span>
    <span id="anchor55717b420.413983739639625">a</span> <a id="anchor54230d30.695983791116618" href="http://sigfrid-lundberg.se/entries/2009/08/quotations/">A
      quotation is much more than an extract</a>
    <span id="anchor55767b10.673936496336915">).</span>
    <span id="anchor55687b20.637640152889136">For</span>
    <span id="anchor55690b30.347115873055121">this</span>
    <span id="anchor55692b40.184622467581473">entry</span>
    <span id="anchor55694b50.609105862029412">I've</span>
    <span id="anchor54364b60.627157886338959">extended</span>
    <span id="anchor54366b70.730729345572521">the</span>
    <span id="anchor54368b80.328374438140716">xslt</span>
    <span id="anchor54371b90.740438441159408">script</span>
    <span id="anchor54373b100.20221277428894">such</span>
    <span id="anchor55719b110.920914357025602">that</span>
    <span id="anchor55769b120.684756536821256">it</span>
    <span id="anchor55724b130.653130332312142">can</span> <a id="anchor54237d50.257265482217663" href="http://exslt.org/str/functions/tokenize/">tokenize</a>
    <span id="anchor55688b10.532440972762388">html</span>
    <span id="anchor54363b20.0876436280494759">text</span>
    <span id="anchor54365b30.26049694244773">embedded</span>
    <span id="anchor54367b40.877383927757565">in</span>
    <span id="anchor54370b50.686124927683792">atom</span>
    <span id="anchor54372b60.0937402360577789">entry</span>
    <span id="anchor54374b70.111275631986221">documents.</span>
    <span id="anchor56026b80.361600907687843">It</span>
    <span id="anchor56028b90.57669051577183">can</span>
    <span id="anchor56030b100.593211455081222">also</span>
    <span id="anchor56032b110.666556591012774">add</span>
    <span id="anchor56036b120.288777775265639">anchors</span>
    <span id="anchor56038b130.775767242897194">(id</span>
    <span id="anchor56040b140.288379411813048">attributes)</span>
    <span id="anchor56042b150.329642078527083">on</span>
    <span id="anchor56044b160.189750982071157">each</span>
    <span id="anchor56046b170.984363202929666">individual</span>
    <span id="anchor56048b180.00357857439833627">word</span>
    <span id="anchor56050b190.827391135425955">(produced</span>
    <span id="anchor56053b200.331479075519125">by</span>
    <span id="anchor56055b210.188201041979809">the</span>
    <span id="anchor56034b220.436496996989705">tokenize</span>
    <span id="anchor56061b230.958636961858085">function)</span>
    <span id="anchor56063b240.918930388017991">in</span>
    <span id="anchor56065b250.764871435130421">the</span>
    <span id="anchor56067b260.699075403017493">whole</span>
    <span id="anchor56070b270.121143161841269">text.</span>
    <span id="anchor56072b280.685785791690362">We</span>
    <span id="anchor56074b290.383831939373087">also</span>
    <span id="anchor56077b300.774273494619072">implement</span>
    <span id="anchor56079b310.943051274373686">a</span>
    <span id="anchor56082b320.916272912135475">javascript</span>
    <span id="anchor56084b330.861917122668548">which</span>
    <span id="anchor56086b340.203548216355754">expose</span>
    <span id="anchor56089b350.793656839427378">these</span>
    <span id="anchor56091b360.548042049886678">anchors</span>
    <span id="anchor56094b370.297288452413533">to</span>
    <span id="anchor56096b380.9049324714136">users,</span>
    <span id="anchor56098b390.909642957574522">and</span>
    <span id="anchor56101b400.873978968185363">allow</span>
    <span id="anchor56103b410.498143926494822">them</span>
    <span id="anchor56057b420.576199548121635">to</span>
    <span id="anchor56111b430.162756743451001">comment</span>
    <span id="anchor56113b440.273911168926354">more</span>
    <span id="anchor56116b450.864578960400344">or</span>
    <span id="anchor56118b460.492398821978084">less</span>
    <span id="anchor56120b470.463662150997511">arbitrary</span>
    <span id="anchor56123b480.848942162864349">point</span>
    <span id="anchor56125b490.49597739637642">in</span>
    <span id="anchor56128b500.291053285957805">the</span>
    <span id="anchor56130b510.180421238383474">text.</span></p>
        <p id="anchor55402b10.359095368701543">
    <span id="anchor56074b10.684178438821891">There</span>
    <span id="anchor56077b20.727550283413171">is</span>
    <span id="anchor56079b30.139058199775898">a</span><strong id="anchor54252a3">
    <span id="anchor56075b10.60310882637422">big</span></strong>
    <span id="anchor56074b10.492421718077931"/>
    <span id="anchor56029b20.838133602793391">drawback</span>
    <span id="anchor56031b30.724251988215489">in</span>
    <span id="anchor56033b40.178207509768292">this</span>
    <span id="anchor54364b50.221965542166478">procedure;</span>
    <span id="anchor54366b60.4985254823689">once</span>
    <span id="anchor54368b70.121258783676316">you</span>
    <span id="anchor54371b80.138238453836291">have</span>
    <span id="anchor54373b90.360442604571787">processed</span>
    <span id="anchor56084b100.324807000032071">your</span>
    <span id="anchor56086b110.931895293729331">text</span>
    <span id="anchor56089b120.908484654458465">and</span>
    <span id="anchor56092b130.622095452445604">the</span>
    <span id="anchor56094b140.836827764677269">anchors</span>
    <span id="anchor56096b150.818127611567326">are</span>
    <span id="anchor56098b160.496074420165305">there,</span>
    <span id="anchor56100b170.33497169070643">then</span>
    <span id="anchor56102b180.39432715968896">you</span><strong id="anchor54256a5">
    <span id="anchor56030b10.658831163616307">must</span>
    <span id="anchor54363b20.608882859632784">not</span></strong>
    <span id="anchor54363b10.258906119623643">change</span>
    <span id="anchor56031b20.15122998512873">them.</span>
    <span id="anchor56085b30.0725450106302952">Each</span>
    <span id="anchor56087b40.107848282022331">word</span>
    <span id="anchor56089b50.647207381970811">has</span>
    <span id="anchor56091b60.3635982965881">become</span>
    <span id="anchor56093b70.288269520405805">a</span>
    <span id="anchor56095b80.331385820327041">resource</span>
    <span id="anchor56098b90.0911485795356094">on</span>
    <span id="anchor56100b100.427327720647365">the</span>
    <span id="anchor56480b110.934494646701261">internet.</span>
    <span id="anchor56484b120.583570298079201">Please</span>
    <span id="anchor56486b130.265461322975094">view</span>
    <span id="anchor56488b140.658746634451089">the</span>
    <span id="anchor56490b150.761777807847493">source</span>
    <span id="anchor56493b160.487426865141572">of</span>
    <span id="anchor56495b170.157272116819989">this</span>
    <span id="anchor56497b180.88303659152381">document,</span>
    <span id="anchor56499b190.625665319443525">before</span>
    <span id="anchor56501b200.517714721391776">you</span>
    <span id="anchor56503b210.207843591090219">use</span>
    <span id="anchor56483b220.557560612707194">the</span>
    <span id="anchor56509b230.426199375850241">stylesheet</span><kbd id="anchor54261a7"> <a id="anchor54262d10.829939043535823" href="http://sigfrid-lundberg.se/footnotes/atom_anchor_id.xsl">atom_anchor_id.xsl</a></kbd>
    <span id="anchor56089b10.394388376918802">.</span></p>
        <pre id="anchor54270c90.244326986951906">
	&lt;span id="anchor54764"&gt;Would&lt;/span&gt;
	&lt;span id="anchor54766"&gt;you&lt;/span&gt;
	&lt;span id="anchor54768"&gt;like&lt;/span&gt;
	&lt;span id="anchor54770"&gt;to&lt;/span&gt;
	&lt;span id="anchor54772"&gt;edit&lt;/span&gt;
	&lt;span id="anchor54774"&gt;this&lt;/span&gt;
	&lt;span id="anchor54778"&gt;text?&lt;/span&gt;
      </pre>
        <p id="anchor54276a10">
    <span id="anchor56488b10.326013463235466">See</span>
    <span id="anchor56494b20.729360068090893">what</span>
    <span id="anchor56496b30.638654146640866">I</span>
    <span id="anchor56498b40.984844627317434">mean?</span>
    <span id="anchor56500b50.338242927258016">I</span>
    <span id="anchor56502b60.89756026626451">cannot</span>
    <span id="anchor56504b70.136074611980503">author</span>
    <span id="anchor56506b80.410787937888311">prose</span>
    <span id="anchor56509b90.00540854828684057">like</span>
    <span id="anchor56649b100.783281993951314">that</span>
    <span id="anchor56652b110.774386234942072">in</span>
    <span id="anchor56655b120.293678068692646">my</span>
    <span id="anchor56657b130.114667813812693">XML</span>
    <span id="anchor56659b140.865534814477682">editor.</span>
    <span id="anchor56662b150.721005789340011">You</span>
    <span id="anchor56664b160.049162460048293">wouldn't</span>
    <span id="anchor56666b170.449105112091221">suffer</span>
    <span id="anchor56668b180.986467112780766">as</span>
    <span id="anchor56670b190.707909094965043">much</span>
    <span id="anchor56672b200.210882919473053">using</span>
    <span id="anchor56674b210.473893977456677">WYSIWYG</span>
    <span id="anchor56654b220.865181211785032">tools,</span>
    <span id="anchor56680b230.0939195105312017">but</span>
    <span id="anchor56682b240.09955929643454">on</span>
    <span id="anchor56685b250.382895932711147">the</span>
    <span id="anchor56687b260.301763101621421">hand</span>
    <span id="anchor56689b270.657119909141734">it</span>
    <span id="anchor56691b280.809095308561388">would</span>
    <span id="anchor56693b290.131702144691582">presumably</span>
    <span id="anchor56696b300.0515082860605364">destroy</span>
    <span id="anchor56698b310.0534222955132938">the</span>
    <span id="anchor56700b320.45771560839271">ID-strings.</span></p>
        <p id="anchor54281a11">
    <span id="anchor56493b10.78086835415143">When</span>
    <span id="anchor56499b20.69207644215416">preparing</span>
    <span id="anchor56501b30.442560235244483">this</span>
    <span id="anchor56503b40.119111280943785">text,</span>
    <span id="anchor56505b50.58963670841867">I</span>
    <span id="anchor56508b60.578634847224986">felt</span>
    <span id="anchor56510b70.529899219297757">that</span>
    <span id="anchor56650b80.59504525670551">I</span>
    <span id="anchor56653b90.3619168411763">had</span>
    <span id="anchor56655b100.304285453774168">to</span>
    <span id="anchor56657b110.888723325398156">prepare</span>
    <span id="anchor56660b120.476584654988993">some</span>
    <span id="anchor56663b130.169820267786188">annotations</span>
    <span id="anchor56665b140.609729114738167">of</span>
    <span id="anchor56667b150.525747115502948">my</span>
    <span id="anchor56669b160.618925380343071">own,</span>
    <span id="anchor56671b170.596196227053272">and</span>
    <span id="anchor56673b180.233656210002329">in</span>
    <span id="anchor56676b190.829808299816124">order</span>
    <span id="anchor56678b200.0700902040442872">to</span>
    <span id="anchor56680b210.0988374213217001">do</span>
    <span id="anchor56659b220.923727810812987">that</span>
    <span id="anchor56687b230.169649500944488">I</span>
    <span id="anchor56689b240.481733354032847">compiled</span>
    <span id="anchor56692b250.225490911968747">the</span>
    <span id="anchor56694b260.826769410086223">text,</span>
    <span id="anchor56697b270.290828662594235">published</span>
    <span id="anchor56699b280.35719305712599">it,</span>
    <span id="anchor56889b290.878277696146759">made</span>
    <span id="anchor56891b300.344250958107529">my</span>
    <span id="anchor56893b310.8149086655187">annotation</span>
    <span id="anchor56895b320.659146049832528">and</span>
    <span id="anchor56898b330.0363273997960274">then</span>
    <span id="anchor56900b340.257468900297521">pasted</span>
    <span id="anchor56902b350.778257331241973">the</span>
    <span id="anchor56904b360.625964108214697">ID</span>
    <span id="anchor56906b370.836103747522507">back</span>
    <span id="anchor56908b380.308156550074069">into</span>
    <span id="anchor56910b390.221009364454546">the</span>
    <span id="anchor56912b400.198020588233145">source</span>
    <span id="anchor56915b410.612442003848237">XML</span>
    <span id="anchor56683b420.109732689852702">in</span>
    <span id="anchor56922b430.6746052436878">order</span>
    <span id="anchor56924b440.782262271634425">to</span>
    <span id="anchor56927b450.719461804590869">be</span>
    <span id="anchor56929b460.200352358725086">able</span>
    <span id="anchor56932b470.401187651511835">to</span>
    <span id="anchor56934b480.315658031178479">continue</span>
    <span id="anchor56936b490.434008568727415">writing.</span>
    <span id="anchor56939b500.230995951327959">Formbased</span>
    <span id="anchor56941b510.385748235222766">proof</span>
    <span id="anchor56944b520.532845990049115">reading</span>
    <span id="anchor56946b530.154723761675285">of</span>
    <span id="anchor56948b540.555397736167255">an</span>
    <span id="anchor56951b550.0145793436163009">existing</span>
    <span id="anchor56953b560.380214673644032">digital</span>
    <span id="anchor56956b570.382167146253477">text</span>
    <span id="anchor56958b580.305408006210536">wouldn't</span>
    <span id="anchor56960b590.737407730770022">be</span>
    <span id="anchor56963b600.260444841934575">any</span>
    <span id="anchor56965b610.649658964318064">problem,</span>
    <span id="anchor56968b620.55231639582306">though.</span></p>
        <h2 id="anchor54287a12">
    <span id="anchor56493b10.919590892232764">Javascript</span>
    <span id="anchor56499b20.685986364579753">&amp;</span>
    <span id="anchor56501b30.809785296120581">DOM</span>
    <span id="anchor56503b40.697848223009076">scripting</span></h2>
        <p id="anchor54291a13">
    <span id="anchor56495b10.311950472328789">You</span>
    <span id="anchor56501b20.645889043643088">can</span>
    <span id="anchor56503b30.00600477261748387">find</span>
    <span id="anchor56653b40.532959837248996">the</span>
    <span id="anchor56655b50.843909631876233">possible</span>
    <span id="anchor56657b60.618446776465721">anchors</span>
    <span id="anchor56659b70.642692527101698">by</span>
    <span id="anchor56662b80.518514875098371">clicking</span>
    <span id="anchor56664b90.400709047634485">on</span>
    <span id="anchor56666b100.362154331226905">the</span>
    <span id="anchor56668b110.718867233823457">link</span><strong id="anchor54294a2">
    <span id="anchor56502b10.801896699611981">Show</span>
    <span id="anchor56653b20.677812362405384">anchors</span></strong>
    <span id="anchor56653b10.152875802085211">,</span>
    <span id="anchor56501b20.0328926504742786">and</span>
    <span id="anchor56503b30.0635605971624891">hide</span>
    <span id="anchor56667b40.685721792134327">them</span>
    <span id="anchor56669b50.187616412149564">again</span>
    <span id="anchor56941b60.618958333795405">by</span>
    <span id="anchor56943b70.700301136216289">clicking</span>
    <span id="anchor56945b80.567831085793595">on</span><strong id="anchor54298a4">
    <span id="anchor56503b10.00112547958322125">Hide</span>
    <span id="anchor56668b20.00570914196116344">anchors</span></strong>
    <span id="anchor56668b10.305238816563617">at</span>
    <span id="anchor56503b20.261570321517796">the</span>
    <span id="anchor57358b30.655368106744889">same</span>
    <span id="anchor57360b40.857555212386677">place</span>
    <span id="anchor57362b50.181161213284899">(there</span>
    <span id="anchor57364b60.341354470858981">is</span>
    <span id="anchor57366b70.667340508507258">a</span>
    <span id="anchor57368b80.879009436293975">toggle).</span>
    <span id="anchor57371b90.65330494318777">There</span>
    <span id="anchor57373b100.313229551684684">are</span>
    <span id="anchor57375b110.885014208911459">two</span>
    <span id="anchor57379b120.186264779971104">javascript</span>
    <span id="anchor57381b130.157139183095255">functions</span>
    <span id="anchor57383b140.503460984911519">handling</span>
    <span id="anchor57385b150.828957307072802">the</span>
    <span id="anchor57388b160.675654058659288">toggling.</span>
    <span id="anchor57390b170.904170033011665">The</span>
    <span id="anchor57392b180.191111637834046">possibly</span>
    <span id="anchor57395b190.394521292017084">most</span>
    <span id="anchor57397b200.706066732157984">interesting,</span>
    <span id="anchor57400b210.86892400023943">but</span>
    <span id="anchor57377b220.547397094567957">also,</span>
    <span id="anchor57406b230.738959382632263">the</span>
    <span id="anchor57408b240.93248459786758">most</span>
    <span id="anchor57411b250.233118886236622">vulnerable,</span>
    <span id="anchor57413b260.926575794781826">feature</span>
    <span id="anchor57415b270.551442931197324">is</span>
    <span id="anchor57418b280.933420022452911">the</span>
    <span id="anchor57420b290.49440688010976">generation</span>
    <span id="anchor57423b300.552568410780546">of</span>
    <span id="anchor57425b310.939129164879736">javascript</span>
    <span id="anchor57427b320.799645696673377">by</span> <a id="anchor54304d60.814138732298342" href="http://sigfrid-lundberg.se/footnotes/make_javascript.xsl">XSLT
      from RSS</a>
    <span id="anchor57363b10.594497271158964">for</span>
    <span id="anchor57366b20.657200909060054">handling</span>
    <span id="anchor57368b30.995299946048902">the</span>
    <span id="anchor57370b40.935851742017945">readable</span>
    <span id="anchor57372b50.32454141710165">notes.</span>
    <span id="anchor57374b60.874309381877216">The</span>
    <span id="anchor57379b70.589156684740054">code</span>
    <span id="anchor57381b80.637770968786334">entering</span>
    <span id="anchor57383b90.759323590788675">the</span>
    <span id="anchor57385b100.77542146517682">notes</span>
    <span id="anchor57388b110.79491015188159">into</span>
    <span id="anchor57391b120.262784575234533">the</span>
    <span id="anchor57394b130.60437877178396">text</span>
    <span id="anchor57396b140.470564210075216">looks</span>
    <span id="anchor57399b150.166954607780536">like</span>
    <span id="anchor57401b160.795490410083668">this:</span></p>
        <pre id="anchor54312c140.865085502557962">
      &lt;script type="text/javascript"&gt;
	    var usedAnchorIds = new Array();
	    var noteTexts     = new Array();
	    
	    usedAnchorIds[0]="anchor55402b10.359095368701543";

	    noteTexts[0]='I had problems obtaining unique id strings from the'
	    +'generate-id() function in XSLT. (siggelundberg, Fri, 18 Sep 2009'
	    +'17:46:27 -0000)';

	    usedAnchorIds[1]="anchor55018b510.584488500647474";

	    noteTexts[1]='This is an arbitrary point in my text. I find this'
	    +'really suitable for adding a footnote. (siggelundberg, Fri, 18 Sep
	    +'2009 03:27:16 -0000)';

	    printNotes(usedAnchorIds,noteTexts);

    &lt;/script&gt;
      </pre>
        <p id="anchor54326a15">
    <span id="anchor57381b10.87302133993852">The</span>
    <span id="anchor57386b20.664414409857436">rest</span>
    <span id="anchor57388b30.412482596660258">of</span>
    <span id="anchor57391b40.611980722105122">the</span>
    <span id="anchor57393b50.596899007259355">features</span>
    <span id="anchor57395b60.64560148289688">are</span>
    <span id="anchor57397b70.538556516421287">readily</span>
    <span id="anchor57399b80.148341937991018">visible</span>
    <span id="anchor57401b90.579021505349791">on</span>
    <span id="anchor57686b100.032963396531047">this</span>
    <span id="anchor57688b110.700910348771564">page.</span>
    <span id="anchor57691b120.518150669763866">You</span>
    <span id="anchor57694b130.832609093204424">have</span>
    <span id="anchor57696b140.515049081069906">to</span>
    <span id="anchor57698b150.112647940457169">reaload</span>
    <span id="anchor57700b160.489810001798817">the</span>
    <span id="anchor57702b170.510349026653147">page</span>
    <span id="anchor57704b180.0484996820094528">to</span>
    <span id="anchor57706b190.814351418900467">see</span>
    <span id="anchor57709b200.384658408064702">the</span>
    <span id="anchor57711b210.637656366749507">new</span>
    <span id="anchor57690b220.45212238722114">footnote</span>
    <span id="anchor57717b230.143981998387716">--</span>
    <span id="anchor57720b240.413077831460665">if</span>
    <span id="anchor57722b250.24703253910273">I</span>
    <span id="anchor57725b260.40676657408791">implement</span>
    <span id="anchor57727b270.0174566032446253">this</span>
    <span id="anchor57729b280.717596749177946">I'll</span>
    <span id="anchor57732b290.573721181868446">will</span>
    <span id="anchor57734b300.812947013328293">refresh</span>
    <span id="anchor57737b310.582682251270247">those</span>
    <span id="anchor57739b320.446742521806966">asynchronously.</span></p>
      </div>
      <div>
        <h2>Footnotes</h2>
        <?php 
	      
                 $xslt_file = "make_note_list.xsl";
	         $xh = new XSLTProcessor();
		 $xh->importStyleSheet( DOMDocument::load($xslt_file));
		 $result = $xh->transformToXML($domdoc);
		 print $result;

	      
	    ?>
      </div>
      <div style="clear:both"> 
	    </div>
      <script type="text/javascript">
	    var usedAnchorIds = new Array();
	    var noteTexts     = new Array();
	    <?php 
	      
                 $xslt_file = "make_javascript.xsl";
	         $jxh = new XSLTProcessor();
		 $jxh->importStyleSheet( DOMDocument::load($xslt_file));
		 $result = $jxh->transformToXML($domdoc);
		 print $result;
	      
	    ?>
	    printNotes(usedAnchorIds,noteTexts);
	  </script>
      <div id="disqus_thread">
	    </div>
      <p style="margin-left:+1%;">
        <a href="http://disqus.com" class="dsq-brlink">blog comments powered
	    by <span class="logo-disqus">Disqus</span></a>
      </p>
    </div>
    <script type="text/javascript" src="http://disqus.com/forums/sigfridlundbergsstuff/embed.js">
	  </script>
    <noscript>
      <a href="http://sigfridlundbergsstuff.disqus.com/?url=http://sigfrid-lundberg.se">
	      View the discussion thread
	  </a>
    </noscript>
    <script type="text/javascript">//<!--
	  (function() {
	      var links = document.getElementsByTagName('a');
	      var query = '?';
	      for(var i = 0; i < links.length; i++) {
		  if(links[i].href.indexOf('#disqus_thread') >= 0) {
		      query += 'url' + i + '=' + encodeURIComponent(links[i].href) + '&';
		  }
	      }
	      document.write('<script charset="utf-8" type="text/javascript" src="http://disqus.com/forums/sigfridlundbergsstuff/get_num_replies.js' + query + '"></' + 'script>');
	  })();
	  //--></script>
    <?php 
      
      $file1 = "/home/s/sigfrid/www/js/urchin.js";
      $file2 = "/home/sigge/fsdata/js/urchin.js";
      if (file_exists($file1)) {
         readfile($file1);
      } elseif (file_exists($file2)) {
         readfile($file2);
      }
      
    ?>
  </body>
</html>
