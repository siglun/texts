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
    <span id="anchor54122b10.84018771715471">There</span>
    <span id="anchor54126b20.394382926819093">is</span>
    <span id="anchor54128b30.783099223758606">a</span>
    <span id="anchor54130b40.798440033476073">link</span>
    <span id="anchor54133b50.911647357936784">at</span>
    <span id="anchor54363b60.197551369293384">the</span>
    <span id="anchor54365b70.335222755714889">top</span>
    <span id="anchor54367b80.768229594811904">of</span>
    <span id="anchor54369b90.277774710803188">this</span>
    <span id="anchor54372b100.553969955795431">page.</span>
    <span id="anchor54374b110.47739705186216">It</span>
    <span id="anchor54378b120.628870924761924">says</span><q id="anchor54189a2"><strong id="anchor54190a1">
    <span id="anchor54128b10.364784472791843">Show</span>
    <span id="anchor54131b20.513400910195616">Anchors</span></strong></q>
    <span id="anchor54371b10.952229725174713">.</span>
    <span id="anchor54130b20.916195068003701">It's</span>
    <span id="anchor54127b30.635711727959901">not</span>
    <span id="anchor54443b40.717296929432683">a</span>
    <span id="anchor54449b50.141602555355803">very</span>
    <span id="anchor54451b60.606968876257059">user</span>
    <span id="anchor54453b70.0163005716243296">friendly</span>
    <span id="anchor54455b80.242886770629737">description</span>
    <span id="anchor54457b90.137231576786019">of</span>
    <span id="anchor54460b100.80417675422699">what</span>
    <span id="anchor54462b110.156679089254085">it</span>
    <span id="anchor54465b120.400944394246183">does,</span>
    <span id="anchor54467b130.129790446781456">but</span>
    <span id="anchor54470b140.108808802025769">I</span>
    <span id="anchor54472b150.998924518003559">cannot</span>
    <span id="anchor54474b160.218256905310907">figure</span>
    <span id="anchor54476b170.512932394404398">out</span>
    <span id="anchor54478b180.839112234692607">a</span>
    <span id="anchor54480b190.612639832595661">better</span>
    <span id="anchor54482b200.296031617697343">term</span>
    <span id="anchor54484b210.637552267703019">right</span>
    <span id="anchor54464b220.524287190066784">now.</span>
    <span id="anchor54490b230.493582986990727">If</span>
    <span id="anchor54493b240.97277502388357">you</span>
    <span id="anchor54495b250.292516784413027">click</span>
    <span id="anchor54497b260.771357697793915">on</span>
    <span id="anchor54500b270.526744979213339">it,</span>
    <span id="anchor54502b280.769913836275187">there</span>
    <span id="anchor54505b290.400228622090178">will</span>
    <span id="anchor54507b300.891529452005182">appear</span>
    <span id="anchor54509b310.283314746005142">a</span>
    <span id="anchor54512b320.352458347264891">link</span>
    <span id="anchor54514b330.807724520008883">after</span>
    <span id="anchor54517b340.919026473965042">most</span>
    <span id="anchor54519b350.0697552762319126">words</span>
    <span id="anchor54521b360.949327075364686">in</span>
    <span id="anchor54524b370.525995350222101">the</span>
    <span id="anchor54526b380.0860558478562421">text.</span>
    <span id="anchor54529b390.192213845994423">These</span>
    <span id="anchor54531b400.66322692700812">are</span>
    <span id="anchor54533b410.890232602548894">the</span>
    <span id="anchor54487b420.348892935248508">annotation</span>
    <span id="anchor54541b430.0641713207886421">anchors.</span>
    <span id="anchor54543b440.0200230488646883">When</span>
    <span id="anchor54546b450.457701737274277">visible,</span>
    <span id="anchor54548b460.0630958383265398">the</span>
    <span id="anchor54551b470.238279954175595">anchors</span>
    <span id="anchor54553b480.970634131678675">appears</span>
    <span id="anchor54555b490.902208073484808">as</span>
    <span id="anchor54558b500.850919786771256">a</span>
    <span id="anchor54560b510.266665749376018">clickable</span>
    <span id="anchor54563b520.539760340722166">asterisk</span>
    <span id="anchor54565b530.375206976372379">'*'.</span>
    <span id="anchor54567b540.760248736366745">Clicking</span>
    <span id="anchor54570b550.512535364140074">on</span>
    <span id="anchor54572b560.667723760785406">one</span>
    <span id="anchor54575b570.53160643416066">of</span>
    <span id="anchor54577b580.0392803433534132">them</span>
    <span id="anchor54579b590.437637596594932">activates</span>
    <span id="anchor54582b600.931835056250838">the</span>
    <span id="anchor54584b610.930809795358595">usual</span> <a id="anchor54197d40.720952343065735" href="http://disqus.com">disqus.com</a>
    <span id="anchor54127b10.284293403050068">forum.</span></p>
        <p id="anchor54203a2">
    <span id="anchor54452b10.738534314901817">Submitting</span>
    <span id="anchor54458b20.639978816565116">a</span>
    <span id="anchor54460b30.354048679747641">footnote</span>
    <span id="anchor54462b40.687861390266503">works,</span>
    <span id="anchor54465b50.165974166321556">but</span>
    <span id="anchor54468b60.440104527603884">the</span>
    <span id="anchor54470b70.880075236260926">script</span>
    <span id="anchor54472b80.829201093329676">never</span>
    <span id="anchor54475b90.330337129687116">get</span>
    <span id="anchor54477b100.228968171043772">the</span>
    <span id="anchor54480b110.893372414583979">acknowledgement</span>
    <span id="anchor54484b120.350360178551804">from</span>
    <span id="anchor54486b130.686669908318049">the</span>
    <span id="anchor54489b140.956468252910519">disqus.com</span>
    <span id="anchor54492b150.588640133193061">server.</span>
    <span id="anchor54494b160.657304039531063">I</span>
    <span id="anchor54497b170.858676325929666">don't</span>
    <span id="anchor54499b180.439559919498656">know</span>
    <span id="anchor54501b190.923969788907082">why,</span>
    <span id="anchor54504b200.398436666651832">but</span>
    <span id="anchor54506b210.814766896336697">it</span>
    <span id="anchor54482b220.684218525273827">seems</span>
    <span id="anchor54513b230.910972030791907">that</span>
    <span id="anchor54515b240.482490656656442">the</span>
    <span id="anchor54518b250.215824958968826">form</span>
    <span id="anchor54520b260.95025237414532">doesn't</span>
    <span id="anchor54522b270.920128253717035">like</span>
    <span id="anchor54525b280.147660014754003">to</span>
    <span id="anchor54527b290.881062169503915">live</span>
    <span id="anchor54530b300.641080596317109">in</span>
    <span id="anchor54532b310.431953418269732">an</span>
    <span id="anchor54534b320.619596483940071">iframe.</span></p>
        <p id="anchor55576b680.592539918884886">
    <span id="anchor54461b10.281059412416564">My</span>
    <span id="anchor54463b20.786002098017373">server</span>
    <span id="anchor54466b30.307457873740912">retrieves</span>
    <span id="anchor54469b40.447033579203781">the</span>
    <span id="anchor54471b50.226106625155595">annotations</span>
    <span id="anchor54474b60.187533109536177">from</span>
    <span id="anchor54476b70.276234672067796">the</span>
    <span id="anchor54478b80.556443755308373">disqus.com</span>
    <span id="anchor54481b90.416501280579949">web</span>
    <span id="anchor54485b100.169607086186114">services</span>
    <span id="anchor54487b110.906803933860177">and</span>
    <span id="anchor54490b120.103171188432337">print</span>
    <span id="anchor54495b130.126075339096633">a</span>
    <span id="anchor54498b140.495444066587577">list</span>
    <span id="anchor54500b150.760475228429062">of</span>
    <span id="anchor54502b160.9847516650263">notes</span>
    <span id="anchor54505b170.935003986551894">at</span>
    <span id="anchor54507b180.684445016870482">the</span>
    <span id="anchor54514b190.38318833121247">end</span>
    <span id="anchor54516b200.749770882422929">of</span>
    <span id="anchor54519b210.368663541678648">the</span>
    <span id="anchor54521b220.294160362004377">page.</span>
    <span id="anchor54522b230.232261538613709">This</span>
    <span id="anchor54525b240.584488500647474">is</span>
    <span id="anchor54527b250.244412735684036">done</span>
    <span id="anchor54530b260.152389791865083">server</span>
    <span id="anchor54532b270.732148515867138">side,</span>
    <span id="anchor54534b280.12547490472229">such</span>
    <span id="anchor54492b290.793470388182192">that</span>
    <span id="anchor55154b300.164101933671209">the</span>
    <span id="anchor55156b310.745071389128022">discussions</span>
    <span id="anchor55158b320.0745298005987563">within</span>
    <span id="anchor55160b330.950104031688582">the</span>
    <span id="anchor55162b340.0525292624032727">footnotes</span>
    <span id="anchor55164b350.521563379802538">will</span>
    <span id="anchor55166b360.176210656378516">be</span>
    <span id="anchor55168b370.240062372405111">visible</span>
    <span id="anchor55171b380.797798051870334">by</span>
    <span id="anchor55173b390.732654411686889">search</span>
    <span id="anchor55175b400.65656365298506">engines.</span>
    <span id="anchor55178b410.96740513852211">The</span>
    <span id="anchor54509b420.639458345547066">place</span>
    <span id="anchor55185b430.759734841883059">of</span>
    <span id="anchor55188b440.0934804771530817">the</span>
    <span id="anchor55190b450.134902411668982">annotation</span>
    <span id="anchor55192b460.52021006984646">is</span>
    <span id="anchor55195b470.0782321417137199">marked</span>
    <span id="anchor55197b480.0699063977552142">as</span>
    <span id="anchor55200b490.204655086251281">a</span>
    <span id="anchor55202b500.461420473391852">note</span>
    <span id="anchor55204b510.819677280178143">with</span>
    <span id="anchor55207b520.57331862839559">a</span>
    <span id="anchor55209b530.755580835396229">link</span>
    <span id="anchor55212b540.0519388187918527">to</span>
    <span id="anchor55214b550.157807128577403">the</span>
    <span id="anchor55216b560.999993571080264">notes.</span>
    <span id="anchor55219b570.204328610656936">You</span>
    <span id="anchor55221b580.889955644444542">may</span>
    <span id="anchor55224b590.125468475802554">read</span>
    <span id="anchor55226b600.99779899930479">the</span>
    <span id="anchor55228b610.0540575776500896">annotation</span>
    <span id="anchor55231b620.870539864930576">when</span>
    <span id="anchor55233b630.0723287994378846">your</span>
    <span id="anchor55236b640.00416160887301043">mouse</span>
    <span id="anchor55238b650.923069127333848">is</span>
    <span id="anchor55240b660.593892179240422">over</span>
    <span id="anchor55243b670.180372265717188">the</span>
    <span id="anchor55245b680.163131499273298">link.</span></p>
        <p id="anchor54217a4">
    <span id="anchor54463b10.391690230645095">Is</span>
    <span id="anchor54534b20.913026677404077">this</span>
    <span id="anchor54484b30.81969515272402">a</span>
    <span id="anchor54486b40.359095368701543">good</span>
    <span id="anchor54465b50.552485022485482">idea?</span>
    <span id="anchor54467b60.579429994141418">Do</span>
    <span id="anchor54470b70.452575845854625">you</span>
    <span id="anchor54472b80.687387434620125">like</span>
    <span id="anchor54475b90.099640063522216">it?</span>
    <span id="anchor54477b100.530807988034006">Should</span>
    <span id="anchor54479b110.757293832375339">all</span>
    <span id="anchor54513b120.304295149773497">my</span>
    <span id="anchor54515b130.992228461425858">pages</span>
    <span id="anchor54518b140.576971112553482">have</span>
    <span id="anchor54520b150.877613778169087">user</span>
    <span id="anchor54522b160.747809296356425">supplied</span>
    <span id="anchor54525b170.628909931345335">foot</span>
    <span id="anchor54527b180.0354209067464904">notes?</span></p>
        <h2 id="anchor54222a5">
    <span id="anchor54528b10.747802866971028">How</span>
    <span id="anchor54485b20.833238542002271">is</span>
    <span id="anchor54532b30.925376551191032">it</span>
    <span id="anchor54534b40.873271342773582">done</span></h2>
        <p id="anchor55018b510.584488500647474">
    <span id="anchor54534b10.831037540841399">In</span>
    <span id="anchor54484b20.979434129306783">order</span>
    <span id="anchor54466b30.743811207238497">to</span>
    <span id="anchor54468b40.903366340279284">add</span>
    <span id="anchor54471b50.983595738179794">footnotes</span>
    <span id="anchor54473b60.666880334572345">to</span>
    <span id="anchor54475b70.497258519054045">a</span>
    <span id="anchor54477b80.16396800343132">text,</span>
    <span id="anchor54480b90.830011833845643">we</span>
    <span id="anchor55650b100.888948750164802">need</span>
    <span id="anchor55653b110.0769946808353973">to</span>
    <span id="anchor55656b120.649706986104002">be</span>
    <span id="anchor55658b130.248044118400684">able</span>
    <span id="anchor55660b140.629479703320879">to</span>
    <span id="anchor55663b150.229136979779758">address</span>
    <span id="anchor55665b160.70061996472097">individual</span>
    <span id="anchor55667b170.316867137475343">positions</span>
    <span id="anchor55670b180.328777043301974">in</span>
    <span id="anchor55672b190.231427952289315">it.</span>
    <span id="anchor55675b200.0741609698506822">These</span>
    <span id="anchor55677b210.633072193541132">positions</span>
    <span id="anchor55655b220.223656413249511">are</span>
    <span id="anchor55683b230.651132082404165">what</span>
    <span id="anchor55686b240.510685971244558">I'd</span>
    <span id="anchor55688b250.971465709605937">like</span>
    <span id="anchor55690b260.280042013283839">to</span>
    <span id="anchor55693b270.546106877991048">call</span>
    <span id="anchor55695b280.719268576111304">annotation</span>
    <span id="anchor55698b290.113280554820448">anchors.</span>
    <span id="anchor55700b300.47148342918208">I've</span>
    <span id="anchor55702b310.592539918884886">already</span>
    <span id="anchor55705b320.944318096127509">briefly</span>
    <span id="anchor55707b330.450917558023202">discussed</span>
    <span id="anchor55710b340.336351125657722">the</span>
    <span id="anchor55712b350.847684435941132">problem</span>
    <span id="anchor55714b360.434513295737334">on</span>
    <span id="anchor55717b370.00323145976440583">how</span>
    <span id="anchor55719b380.344942954995177">to</span>
    <span id="anchor55722b390.598481299634316">create</span>
    <span id="anchor55724b400.83324329407571">identifiers</span>
    <span id="anchor55726b410.233891704694318">(see</span>
    <span id="anchor55679b420.675475980469713">a</span> <a id="anchor54232d30.482950279714051" href="http://sigfrid-lundberg.se/entries/2009/08/quotations/">A
      quotation is much more than an extract</a>
    <span id="anchor55729b10.481935823095001">).</span>
    <span id="anchor55731b20.304955683324931">For</span>
    <span id="anchor55733b30.71208725995947">this</span>
    <span id="anchor54466b40.18255578735031">entry</span>
    <span id="anchor54468b50.621822821265935">I've</span>
    <span id="anchor54471b60.0408643027957828">extended</span>
    <span id="anchor54473b70.413983739639625">the</span>
    <span id="anchor54475b80.695983791116618">xslt</span>
    <span id="anchor54477b90.673936496336915">script</span>
    <span id="anchor54479b100.637640152889136">such</span>
    <span id="anchor55656b110.347115873055121">that</span>
    <span id="anchor55660b120.184622467581473">it</span>
    <span id="anchor55662b130.609105862029412">can</span> <a id="anchor54239d50.627157886338959" href="http://exslt.org/str/functions/tokenize/">tokenize</a>
    <span id="anchor55730b10.730729345572521">html</span>
    <span id="anchor54468b20.328374438140716">text</span>
    <span id="anchor54470b30.740438441159408">embedded</span>
    <span id="anchor54472b40.20221277428894">in</span>
    <span id="anchor54475b50.920914357025602">atom</span>
    <span id="anchor54477b60.684756536821256">entry</span>
    <span id="anchor54479b70.653130332312142">documents.</span>
    <span id="anchor55993b80.257265482217663">It</span>
    <span id="anchor55995b90.532440972762388">can</span>
    <span id="anchor55997b100.0876436280494759">also</span>
    <span id="anchor55999b110.26049694244773">add</span>
    <span id="anchor56001b120.877383927757565">anchors</span>
    <span id="anchor56004b130.686124927683792">(id</span>
    <span id="anchor56006b140.0937402360577789">attributes)</span>
    <span id="anchor56008b150.111275631986221">on</span>
    <span id="anchor56010b160.361600907687843">each</span>
    <span id="anchor56012b170.57669051577183">individual</span>
    <span id="anchor56014b180.593211455081222">word</span>
    <span id="anchor56017b190.666556591012774">(produced</span>
    <span id="anchor56019b200.288777775265639">by</span>
    <span id="anchor56022b210.775767242897194">the</span>
    <span id="anchor55733b220.288379411813048">tokenize</span>
    <span id="anchor56028b230.329642078527083">function)</span>
    <span id="anchor56030b240.189750982071157">in</span>
    <span id="anchor56033b250.984363202929666">the</span>
    <span id="anchor56035b260.00357857439833627">whole</span>
    <span id="anchor56038b270.827391135425955">text.</span>
    <span id="anchor56040b280.331479075519125">We</span>
    <span id="anchor56042b290.188201041979809">also</span>
    <span id="anchor56045b300.436496996989705">implement</span>
    <span id="anchor56047b310.958636961858085">a</span>
    <span id="anchor56050b320.918930388017991">javascript</span>
    <span id="anchor56052b330.764871435130421">which</span>
    <span id="anchor56054b340.699075403017493">expose</span>
    <span id="anchor56057b350.121143161841269">these</span>
    <span id="anchor56059b360.685785791690362">anchors</span>
    <span id="anchor56062b370.383831939373087">to</span>
    <span id="anchor56064b380.774273494619072">users,</span>
    <span id="anchor56066b390.943051274373686">and</span>
    <span id="anchor56069b400.916272912135475">allow</span>
    <span id="anchor56071b410.861917122668548">them</span>
    <span id="anchor56024b420.203548216355754">to</span>
    <span id="anchor56079b430.793656839427378">comment</span>
    <span id="anchor56081b440.548042049886678">more</span>
    <span id="anchor56084b450.297288452413533">or</span>
    <span id="anchor56086b460.9049324714136">less</span>
    <span id="anchor56088b470.909642957574522">arbitrary</span>
    <span id="anchor56091b480.873978968185363">point</span>
    <span id="anchor56093b490.498143926494822">in</span>
    <span id="anchor56096b500.576199548121635">the</span>
    <span id="anchor56098b510.162756743451001">text.</span></p>
        <p id="anchor55402b10.359095368701543">
    <span id="anchor56023b10.273911168926354">There</span>
    <span id="anchor56031b20.864578960400344">is</span>
    <span id="anchor56034b30.492398821978084">a</span><strong id="anchor54254a3">
    <span id="anchor55731b10.463662150997511">big</span></strong>
    <span id="anchor55733b10.848942162864349"/>
    <span id="anchor56030b20.49597739637642">drawback</span>
    <span id="anchor56033b30.291053285957805">in</span>
    <span id="anchor54467b40.180421238383474">this</span>
    <span id="anchor54470b50.684178438821891">procedure;</span>
    <span id="anchor54472b60.727550283413171">once</span>
    <span id="anchor54474b70.139058199775898">you</span>
    <span id="anchor54476b80.60310882637422">have</span>
    <span id="anchor54478b90.492421718077931">processed</span>
    <span id="anchor54480b100.838133602793391">your</span>
    <span id="anchor55994b110.724251988215489">text</span>
    <span id="anchor55998b120.178207509768292">and</span>
    <span id="anchor56000b130.221965542166478">the</span>
    <span id="anchor56002b140.4985254823689">anchors</span>
    <span id="anchor56004b150.121258783676316">are</span>
    <span id="anchor56007b160.138238453836291">there,</span>
    <span id="anchor56009b170.360442604571787">then</span>
    <span id="anchor56012b180.324807000032071">you</span><strong id="anchor54258a5">
    <span id="anchor56010b10.931895293729331">must</span>
    <span id="anchor56032b20.908484654458465">not</span></strong>
    <span id="anchor56009b10.622095452445604">change</span>
    <span id="anchor54480b20.836827764677269">them.</span>
    <span id="anchor56032b30.818127611567326">Each</span>
    <span id="anchor55993b40.496074420165305">word</span>
    <span id="anchor55995b50.33497169070643">has</span>
    <span id="anchor55997b60.39432715968896">become</span>
    <span id="anchor55999b70.658831163616307">a</span>
    <span id="anchor56001b80.608882859632784">resource</span>
    <span id="anchor56004b90.258906119623643">on</span>
    <span id="anchor56006b100.15122998512873">the</span>
    <span id="anchor56008b110.0725450106302952">internet.</span>
    <span id="anchor56452b120.107848282022331">Please</span>
    <span id="anchor56454b130.647207381970811">view</span>
    <span id="anchor56456b140.3635982965881">the</span>
    <span id="anchor56458b150.288269520405805">source</span>
    <span id="anchor56460b160.331385820327041">of</span>
    <span id="anchor56462b170.0911485795356094">this</span>
    <span id="anchor56464b180.427327720647365">document,</span>
    <span id="anchor56466b190.934494646701261">before</span>
    <span id="anchor56469b200.583570298079201">you</span>
    <span id="anchor56471b210.265461322975094">use</span>
    <span id="anchor56450b220.658746634451089">the</span>
    <span id="anchor56477b230.761777807847493">stylesheet</span><kbd id="anchor54263a7"> <a id="anchor54264d10.487426865141572" href="http://sigfrid-lundberg.se/footnotes/atom_anchor_id.xsl">atom_anchor_id.xsl</a></kbd>
    <span id="anchor56009b10.157272116819989">.</span></p>
        <pre id="anchor54271c80.88303659152381">
	&lt;span id="anchor54764"&gt;Would&lt;/span&gt;
	&lt;span id="anchor54766"&gt;you&lt;/span&gt;
	&lt;span id="anchor54768"&gt;like&lt;/span&gt;
	&lt;span id="anchor54770"&gt;to&lt;/span&gt;
	&lt;span id="anchor54772"&gt;edit&lt;/span&gt;
	&lt;span id="anchor54774"&gt;this&lt;/span&gt;
	&lt;span id="anchor54778"&gt;text?&lt;/span&gt;
      </pre>
        <p id="anchor54278a9">
    <span id="anchor56454b10.625665319443525">See</span>
    <span id="anchor56460b20.517714721391776">what</span>
    <span id="anchor56462b30.207843591090219">I</span>
    <span id="anchor56464b40.557560612707194">mean?</span>
    <span id="anchor56466b50.426199375850241">I</span>
    <span id="anchor56468b60.829939043535823">cannot</span>
    <span id="anchor56470b70.394388376918802">author</span>
    <span id="anchor56472b80.244326986951906">prose</span>
    <span id="anchor56474b90.326013463235466">like</span>
    <span id="anchor56477b100.729360068090893">that</span>
    <span id="anchor56616b110.638654146640866">in</span>
    <span id="anchor56619b120.984844627317434">my</span>
    <span id="anchor56622b130.338242927258016">XML</span>
    <span id="anchor56624b140.89756026626451">editor.</span>
    <span id="anchor56626b150.136074611980503">You</span>
    <span id="anchor56628b160.410787937888311">wouldn't</span>
    <span id="anchor56630b170.00540854828684057">suffer</span>
    <span id="anchor56632b180.783281993951314">as</span>
    <span id="anchor56634b190.774386234942072">much</span>
    <span id="anchor56636b200.293678068692646">using</span>
    <span id="anchor56639b210.114667813812693">WYSIWYG</span>
    <span id="anchor56618b220.865534814477682">tools,</span>
    <span id="anchor56645b230.721005789340011">but</span>
    <span id="anchor56647b240.049162460048293">on</span>
    <span id="anchor56650b250.449105112091221">the</span>
    <span id="anchor56652b260.986467112780766">hand</span>
    <span id="anchor56654b270.707909094965043">it</span>
    <span id="anchor56657b280.210882919473053">would</span>
    <span id="anchor56659b290.473893977456677">presumably</span>
    <span id="anchor56662b300.865181211785032">destroy</span>
    <span id="anchor56664b310.0939195105312017">the</span>
    <span id="anchor56666b320.09955929643454">ID-strings.</span></p>
        <p id="anchor54282a10">
    <span id="anchor56668b10.382895932711147">When</span>
    <span id="anchor56618b20.301763101621421">preparing</span>
    <span id="anchor56463b30.657119909141734">this</span>
    <span id="anchor56465b40.809095308561388">text,</span>
    <span id="anchor56467b50.131702144691582">I</span>
    <span id="anchor56469b60.0515082860605364">felt</span>
    <span id="anchor56471b70.0534222955132938">that</span>
    <span id="anchor56474b80.45771560839271">I</span>
    <span id="anchor56476b90.78086835415143">had</span>
    <span id="anchor56478b100.69207644215416">to</span>
    <span id="anchor56620b110.442560235244483">prepare</span>
    <span id="anchor56624b120.119111280943785">some</span>
    <span id="anchor56626b130.58963670841867">annotations</span>
    <span id="anchor56629b140.578634847224986">of</span>
    <span id="anchor56631b150.529899219297757">my</span>
    <span id="anchor56634b160.59504525670551">own,</span>
    <span id="anchor56636b170.3619168411763">and</span>
    <span id="anchor56638b180.304285453774168">in</span>
    <span id="anchor56641b190.888723325398156">order</span>
    <span id="anchor56643b200.476584654988993">to</span>
    <span id="anchor56646b210.169820267786188">do</span>
    <span id="anchor56623b220.609729114738167">that</span>
    <span id="anchor56652b230.525747115502948">I</span>
    <span id="anchor56655b240.618925380343071">compiled</span>
    <span id="anchor56657b250.596196227053272">the</span>
    <span id="anchor56659b260.233656210002329">text,</span>
    <span id="anchor56662b270.829808299816124">published</span>
    <span id="anchor56664b280.0700902040442872">it,</span>
    <span id="anchor56855b290.0988374213217001">made</span>
    <span id="anchor56857b300.923727810812987">my</span>
    <span id="anchor56860b310.169649500944488">annotation</span>
    <span id="anchor56862b320.481733354032847">and</span>
    <span id="anchor56864b330.225490911968747">then</span>
    <span id="anchor56866b340.826769410086223">pasted</span>
    <span id="anchor56868b350.290828662594235">the</span>
    <span id="anchor56870b360.35719305712599">ID</span>
    <span id="anchor56872b370.878277696146759">back</span>
    <span id="anchor56874b380.344250958107529">into</span>
    <span id="anchor56877b390.8149086655187">the</span>
    <span id="anchor56879b400.659146049832528">source</span>
    <span id="anchor56881b410.0363273997960274">XML</span>
    <span id="anchor56648b420.257468900297521">in</span>
    <span id="anchor56888b430.778257331241973">order</span>
    <span id="anchor56891b440.625964108214697">to</span>
    <span id="anchor56893b450.836103747522507">be</span>
    <span id="anchor56895b460.308156550074069">able</span>
    <span id="anchor56897b470.221009364454546">to</span>
    <span id="anchor56900b480.198020588233145">continue</span>
    <span id="anchor56902b490.612442003848237">writing.</span>
    <span id="anchor56904b500.109732689852702">Formbased</span>
    <span id="anchor56907b510.6746052436878">proof</span>
    <span id="anchor56909b520.782262271634425">reading</span>
    <span id="anchor56912b530.719461804590869">of</span>
    <span id="anchor56914b540.200352358725086">an</span>
    <span id="anchor56916b550.401187651511835">existing</span>
    <span id="anchor56919b560.315658031178479">digital</span>
    <span id="anchor56921b570.434008568727415">text</span>
    <span id="anchor56924b580.230995951327959">wouldn't</span>
    <span id="anchor56926b590.385748235222766">be</span>
    <span id="anchor56928b600.532845990049115">any</span>
    <span id="anchor56931b610.154723761675285">problem,</span>
    <span id="anchor56933b620.555397736167255">though.</span></p>
        <h2 id="anchor54289a11">
    <span id="anchor56933b10.0145793436163009">Javascript</span>
    <span id="anchor56463b20.380214673644032">&amp;</span>
    <span id="anchor56465b30.382167146253477">DOM</span>
    <span id="anchor56467b40.305408006210536">scripting</span></h2>
        <p id="anchor54293a12">
    <span id="anchor56463b10.737407730770022">You</span>
    <span id="anchor56466b20.260444841934575">can</span>
    <span id="anchor56468b30.649658964318064">find</span>
    <span id="anchor56633b40.55231639582306">the</span>
    <span id="anchor56636b50.919590892232764">possible</span>
    <span id="anchor56638b60.685986364579753">anchors</span>
    <span id="anchor56640b70.809785296120581">by</span>
    <span id="anchor56642b80.697848223009076">clicking</span>
    <span id="anchor56644b90.311950472328789">on</span>
    <span id="anchor56647b100.645889043643088">the</span>
    <span id="anchor56649b110.00600477261748387">link</span><strong id="anchor54296a2">
    <span id="anchor56650b10.532959837248996">Show</span>
    <span id="anchor56464b20.843909631876233">anchors</span></strong>
    <span id="anchor56649b10.618446776465721">,</span>
    <span id="anchor56464b20.642692527101698">and</span>
    <span id="anchor56642b30.518514875098371">hide</span>
    <span id="anchor56644b40.400709047634485">them</span>
    <span id="anchor56907b50.362154331226905">again</span>
    <span id="anchor56909b60.718867233823457">by</span>
    <span id="anchor56911b70.801896699611981">clicking</span>
    <span id="anchor56914b80.677812362405384">on</span><strong id="anchor54300a4">
    <span id="anchor56465b10.152875802085211">Hide</span>
    <span id="anchor56644b20.0328926504742786">anchors</span></strong>
    <span id="anchor56465b10.0635605971624891">at</span>
    <span id="anchor57324b20.685721792134327">the</span>
    <span id="anchor57326b30.187616412149564">same</span>
    <span id="anchor57328b40.618958333795405">place</span>
    <span id="anchor57330b50.700301136216289">(there</span>
    <span id="anchor57332b60.567831085793595">is</span>
    <span id="anchor57335b70.00112547958322125">a</span>
    <span id="anchor57337b80.00570914196116344">toggle).</span>
    <span id="anchor57339b90.305238816563617">There</span>
    <span id="anchor57341b100.261570321517796">are</span>
    <span id="anchor57343b110.655368106744889">two</span>
    <span id="anchor57347b120.857555212386677">javascript</span>
    <span id="anchor57349b130.181161213284899">functions</span>
    <span id="anchor57351b140.341354470858981">handling</span>
    <span id="anchor57353b150.667340508507258">the</span>
    <span id="anchor57355b160.879009436293975">toggling.</span>
    <span id="anchor57358b170.65330494318777">The</span>
    <span id="anchor57360b180.313229551684684">possibly</span>
    <span id="anchor57362b190.885014208911459">most</span>
    <span id="anchor57365b200.186264779971104">interesting,</span>
    <span id="anchor57367b210.157139183095255">but</span>
    <span id="anchor57345b220.503460984911519">also,</span>
    <span id="anchor57374b230.828957307072802">the</span>
    <span id="anchor57376b240.675654058659288">most</span>
    <span id="anchor57378b250.904170033011665">vulnerable,</span>
    <span id="anchor57381b260.191111637834046">feature</span>
    <span id="anchor57383b270.394521292017084">is</span>
    <span id="anchor57386b280.706066732157984">the</span>
    <span id="anchor57388b290.86892400023943">generation</span>
    <span id="anchor57390b300.547397094567957">of</span>
    <span id="anchor57393b310.738959382632263">javascript</span>
    <span id="anchor57395b320.93248459786758">by</span> <a id="anchor54305d60.233118886236622" href="http://sigfrid-lundberg.se/footnotes/make_javascript.xsl">XSLT
      from RSS</a>
    <span id="anchor57330b10.926575794781826">for</span>
    <span id="anchor57332b20.551442931197324">handling</span>
    <span id="anchor57335b30.933420022452911">the</span>
    <span id="anchor57337b40.49440688010976">readable</span>
    <span id="anchor57339b50.552568410780546">notes.</span>
    <span id="anchor57341b60.939129164879736">The</span>
    <span id="anchor57343b70.799645696673377">code</span>
    <span id="anchor57345b80.814138732298342">entering</span>
    <span id="anchor57348b90.594497271158964">the</span>
    <span id="anchor57350b100.657200909060054">notes</span>
    <span id="anchor57352b110.995299946048902">into</span>
    <span id="anchor57356b120.935851742017945">the</span>
    <span id="anchor57359b130.32454141710165">text</span>
    <span id="anchor57361b140.874309381877216">looks</span>
    <span id="anchor57363b150.589156684740054">like</span>
    <span id="anchor57366b160.637770968786334">this:</span></p>
        <pre id="anchor54313c130.759323590788675">
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
        <p id="anchor54327a14">
    <span id="anchor57362b10.77542146517682">The</span>
    <span id="anchor57330b20.79491015188159">rest</span>
    <span id="anchor57332b30.262784575234533">of</span>
    <span id="anchor57334b40.60437877178396">the</span>
    <span id="anchor57336b50.470564210075216">features</span>
    <span id="anchor57338b60.166954607780536">are</span>
    <span id="anchor57340b70.795490410083668">readily</span>
    <span id="anchor57342b80.865085502557962">visible</span>
    <span id="anchor57344b90.87302133993852">on</span>
    <span id="anchor57653b100.664414409857436">this</span>
    <span id="anchor57655b110.412482596660258">page.</span>
    <span id="anchor57659b120.611980722105122">You</span>
    <span id="anchor57661b130.596899007259355">have</span>
    <span id="anchor57663b140.64560148289688">to</span>
    <span id="anchor57665b150.538556516421287">reaload</span>
    <span id="anchor57667b160.148341937991018">the</span>
    <span id="anchor57669b170.579021505349791">page</span>
    <span id="anchor57671b180.032963396531047">to</span>
    <span id="anchor57674b190.700910348771564">see</span>
    <span id="anchor57676b200.518150669763866">the</span>
    <span id="anchor57678b210.832609093204424">new</span>
    <span id="anchor57657b220.515049081069906">footnote</span>
    <span id="anchor57685b230.112647940457169">--</span>
    <span id="anchor57687b240.489810001798817">if</span>
    <span id="anchor57689b250.510349026653147">I</span>
    <span id="anchor57692b260.0484996820094528">implement</span>
    <span id="anchor57694b270.814351418900467">this</span>
    <span id="anchor57697b280.384658408064702">I'll</span>
    <span id="anchor57699b290.637656366749507">will</span>
    <span id="anchor57701b300.45212238722114">refresh</span>
    <span id="anchor57704b310.143981998387716">those</span>
    <span id="anchor57706b320.413077831460665">asynchronously.</span></p>
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
