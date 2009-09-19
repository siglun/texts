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
    <script type="text/javascript">
	      var disqus_developer=1;
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
    <span id="anchor54122b10.84018771715471">In</span>
    <span id="anchor54125b20.394382926819093">order</span>
    <span id="anchor54128b30.783099223758606">to</span>
    <span id="anchor54130b40.798440033476073">understand</span>
    <span id="anchor54133b50.911647357936784">what's</span>
    <span id="anchor54135b60.197551369293384">going</span>
    <span id="anchor54372b70.335222755714889">on</span>
    <span id="anchor54374b80.768229594811904">here,</span>
    <span id="anchor54376b90.277774710803188">you</span>
    <span id="anchor54379b100.553969955795431">have</span>
    <span id="anchor54381b110.47739705186216">have</span>
    <span id="anchor54385b120.628870924761924">to</span> <a id="anchor54189d20.364784472791843" href="http://sigfrid-lundberg.se/footnotes/">visit the
      resource</a>
    <span id="anchor54126b10.513400910195616">.</span>
    <span id="anchor54129b20.952229725174713">There</span>
    <span id="anchor54132b30.916195068003701">is</span>
    <span id="anchor54134b40.635711727959901">a</span>
    <span id="anchor54373b50.717296929432683">some</span>
    <span id="anchor54375b60.141602555355803">scripting</span>
    <span id="anchor54378b70.606968876257059">going</span>
    <span id="anchor54380b80.0163005716243296">on</span>
    <span id="anchor54382b90.242886770629737">which</span>
    <span id="anchor54452b100.137231576786019">cannot</span>
    <span id="anchor54454b110.80417675422699">be</span>
    <span id="anchor54458b120.156679089254085">syndicated</span></p>
        <h2 id="anchor54197a2">
    <span id="anchor54457b10.400944394246183">What</span>
    <span id="anchor54451b20.129790446781456">you</span>
    <span id="anchor54453b30.108808802025769">can</span>
    <span id="anchor54129b40.998924518003559">do</span>
    <span id="anchor54132b50.218256905310907">here</span></h2>
        <p id="anchor54200a3">
    <span id="anchor54450b10.512932394404398">There</span>
    <span id="anchor54452b20.839112234692607">is</span>
    <span id="anchor54455b30.612639832595661">a</span>
    <span id="anchor54561b40.296031617697343">link</span>
    <span id="anchor54564b50.637552267703019">at</span>
    <span id="anchor54566b60.524287190066784">the</span>
    <span id="anchor54568b70.493582986990727">top</span>
    <span id="anchor54570b80.97277502388357">of</span>
    <span id="anchor54572b90.292516784413027">this</span>
    <span id="anchor54574b100.771357697793915">page</span>
    <span id="anchor54577b110.526744979213339">(if</span>
    <span id="anchor54580b120.769913836275187">you're</span>
    <span id="anchor54583b130.400228622090178">reading</span>
    <span id="anchor54585b140.891529452005182">the</span>
    <span id="anchor54587b150.283314746005142">HTML</span>
    <span id="anchor54589b160.352458347264891">version</span> <a id="anchor54203d20.807724520008883" href="http://sigfrid-lundberg.se/footnotes/">directly from my
      site</a>
    <span id="anchor54453b10.919026473965042">,</span>
    <span id="anchor54579b20.0697552762319126">that</span>
    <span id="anchor54584b30.949327075364686">is).</span>
    <span id="anchor54586b40.525995350222101">It</span>
    <span id="anchor54560b50.0860558478562421">says</span>
    <span id="anchor54562b60.192213845994423">"Show</span>
    <span id="anchor54565b70.66322692700812">anchors".</span>
    <span id="anchor54567b80.890232602548894">It's</span>
    <span id="anchor54570b90.348892935248508">not</span>
    <span id="anchor54572b100.0641713207886421">a</span>
    <span id="anchor54574b110.0200230488646883">very</span>
    <span id="anchor54702b120.457701737274277">user</span>
    <span id="anchor54704b130.0630958383265398">friendly</span>
    <span id="anchor54706b140.238279954175595">description</span>
    <span id="anchor54708b150.970634131678675">of</span>
    <span id="anchor54710b160.902208073484808">what</span>
    <span id="anchor54713b170.850919786771256">it</span>
    <span id="anchor54715b180.266665749376018">does,</span>
    <span id="anchor54717b190.539760340722166">but</span>
    <span id="anchor54719b200.375206976372379">I</span>
    <span id="anchor54721b210.760248736366745">cannot</span>
    <span id="anchor54700b220.512535364140074">figure</span>
    <span id="anchor54727b230.667723760785406">out</span>
    <span id="anchor54729b240.53160643416066">a</span>
    <span id="anchor54732b250.0392803433534132">better</span>
    <span id="anchor54734b260.437637596594932">term</span>
    <span id="anchor54736b270.931835056250838">right</span>
    <span id="anchor54739b280.930809795358595">now.</span>
    <span id="anchor54741b290.720952343065735">If</span>
    <span id="anchor54744b300.284293403050068">you</span>
    <span id="anchor54746b310.738534314901817">click</span>
    <span id="anchor54748b320.639978816565116">on</span>
    <span id="anchor54751b330.354048679747641">it,</span>
    <span id="anchor54753b340.687861390266503">there</span>
    <span id="anchor54756b350.165974166321556">will</span>
    <span id="anchor54758b360.440104527603884">appear</span>
    <span id="anchor54760b370.880075236260926">a</span>
    <span id="anchor54763b380.829201093329676">link</span>
    <span id="anchor54765b390.330337129687116">after</span>
    <span id="anchor54768b400.228968171043772">most</span>
    <span id="anchor54770b410.893372414583979">words</span>
    <span id="anchor54723b420.350360178551804">in</span>
    <span id="anchor54778b430.686669908318049">the</span>
    <span id="anchor54780b440.956468252910519">text.</span>
    <span id="anchor54782b450.588640133193061">These</span>
    <span id="anchor54785b460.657304039531063">are</span>
    <span id="anchor54787b470.858676325929666">the</span>
    <span id="anchor54790b480.439559919498656">annotation</span>
    <span id="anchor54792b490.923969788907082">anchors</span>
    <span id="anchor54794b500.398436666651832">of</span>
    <span id="anchor54797b510.814766896336697">this</span>
    <span id="anchor54799b520.684218525273827">text.</span></p>
        <p id="anchor54213a4">
    <span id="anchor54578b10.910972030791907">When</span>
    <span id="anchor54585b20.482490656656442">visible,</span>
    <span id="anchor54587b30.215824958968826">the</span>
    <span id="anchor54560b40.95025237414532">anchors</span>
    <span id="anchor54562b50.920128253717035">appears</span>
    <span id="anchor54565b60.147660014754003">as</span>
    <span id="anchor54567b70.881062169503915">a</span>
    <span id="anchor54569b80.641080596317109">clickable</span>
    <span id="anchor54571b90.431953418269732">asterisk</span>
    <span id="anchor54574b100.619596483940071">'*',</span>
    <span id="anchor54700b110.281059412416564">and</span>
    <span id="anchor54704b120.786002098017373">and</span>
    <span id="anchor54707b130.307457873740912">a</span>
    <span id="anchor54709b140.447033579203781">click</span>
    <span id="anchor54712b150.226106625155595">on</span>
    <span id="anchor54714b160.187533109536177">one</span>
    <span id="anchor54716b170.276234672067796">of</span>
    <span id="anchor54719b180.556443755308373">them</span>
    <span id="anchor54721b190.416501280579949">activates</span>
    <span id="anchor54724b200.169607086186114">the</span>
    <span id="anchor54726b210.906803933860177">usual</span> <a id="anchor54216d20.103171188432337" href="disqus.com">disqus.com forum</a>
    <span id="anchor54730b10.126075339096633">.</span>
    <span id="anchor54574b20.495444066587577">This</span>
    <span id="anchor54584b30.760475228429062">is</span>
    <span id="anchor54586b40.9847516650263">by</span>
    <span id="anchor54560b50.935003986551894">some</span>
    <span id="anchor54562b60.684445016870482">client</span>
    <span id="anchor54565b70.38318833121247">side</span>
    <span id="anchor54567b80.749770882422929">DOM</span>
    <span id="anchor54569b90.368663541678648">programming.</span></p>
        <p id="anchor54223a5">
    <span id="anchor54584b10.294160362004377">Submitting</span>
    <span id="anchor54562b20.232261538613709">a</span>
    <span id="anchor54564b30.584488500647474">footnote</span>
    <span id="anchor54566b40.244412735684036">works,</span>
    <span id="anchor54569b50.152389791865083">but</span>
    <span id="anchor55231b60.732148515867138">the</span>
    <span id="anchor55233b70.12547490472229">script</span>
    <span id="anchor55235b80.793470388182192">never</span>
    <span id="anchor55237b90.164101933671209">get</span>
    <span id="anchor55240b100.745071389128022">the</span>
    <span id="anchor55242b110.0745298005987563">acknowledgement</span>
    <span id="anchor55245b120.950104031688582">from</span>
    <span id="anchor55247b130.0525292624032727">the</span>
    <span id="anchor55250b140.521563379802538">disqus.com</span>
    <span id="anchor55252b150.176210656378516">server.</span>
    <span id="anchor55254b160.240062372405111">I</span>
    <span id="anchor55256b170.797798051870334">don't</span>
    <span id="anchor55258b180.732654411686889">know</span>
    <span id="anchor55260b190.65656365298506">why,</span>
    <span id="anchor55263b200.96740513852211">but</span>
    <span id="anchor55265b210.639458345547066">it</span>
    <span id="anchor55244b220.759734841883059">seems</span>
    <span id="anchor55271b230.0934804771530817">that</span>
    <span id="anchor55274b240.134902411668982">the</span>
    <span id="anchor55276b250.52021006984646">form</span>
    <span id="anchor55278b260.0782321417137199">doesn't</span>
    <span id="anchor55281b270.0699063977552142">like</span>
    <span id="anchor55283b280.204655086251281">to</span>
    <span id="anchor55286b290.461420473391852">live</span>
    <span id="anchor55288b300.819677280178143">in</span>
    <span id="anchor55290b310.57331862839559">an</span>
    <span id="anchor55293b320.755580835396229">iframe.</span></p>
        <p id="anchor54228a6">
    <span id="anchor54568b10.0519388187918527">My</span>
    <span id="anchor54561b20.157807128577403">server</span>
    <span id="anchor54564b30.999993571080264">retrieves</span>
    <span id="anchor55232b40.204328610656936">the</span>
    <span id="anchor55234b50.889955644444542">annotations</span>
    <span id="anchor55236b60.125468475802554">from</span>
    <span id="anchor55238b70.99779899930479">the</span>
    <span id="anchor55241b80.0540575776500896">disqus.com</span>
    <span id="anchor55243b90.870539864930576">web</span>
    <span id="anchor55245b100.0723287994378846">services</span>
    <span id="anchor55248b110.00416160887301043">and</span>
    <span id="anchor55252b120.923069127333848">print</span>
    <span id="anchor55254b130.593892179240422">a</span>
    <span id="anchor55256b140.180372265717188">list</span>
    <span id="anchor55259b150.163131499273298">of</span>
    <span id="anchor55261b160.391690230645095">notes</span>
    <span id="anchor55264b170.913026677404077">at</span>
    <span id="anchor55266b180.81969515272402">the</span>
    <span id="anchor55268b190.359095368701543">end</span>
    <span id="anchor55271b200.552485022485482">of</span>
    <span id="anchor55273b210.579429994141418">the</span>
    <span id="anchor55250b220.452575845854625">page.</span>
    <span id="anchor55280b230.687387434620125">This</span>
    <span id="anchor55282b240.099640063522216">is</span>
    <span id="anchor55284b250.530807988034006">done</span>
    <span id="anchor55287b260.757293832375339">server</span>
    <span id="anchor55289b270.304295149773497">side,</span>
    <span id="anchor55482b280.992228461425858">shuch</span>
    <span id="anchor55484b290.576971112553482">that</span>
    <span id="anchor55486b300.877613778169087">the</span>
    <span id="anchor55488b310.747809296356425">discussions</span>
    <span id="anchor55490b320.628909931345335">within</span>
    <span id="anchor55492b330.0354209067464904">the</span>
    <span id="anchor55494b340.747802866971028">footnotes</span>
    <span id="anchor55496b350.833238542002271">will</span>
    <span id="anchor55499b360.925376551191032">be</span>
    <span id="anchor55501b370.873271342773582">visible</span>
    <span id="anchor55503b380.831037540841399">by</span>
    <span id="anchor55505b390.979434129306783">search</span>
    <span id="anchor55507b400.743811207238497">engines.</span>
    <span id="anchor55509b410.903366340279284">The</span>
    <span id="anchor55276b420.983595738179794">place</span>
    <span id="anchor55517b430.666880334572345">of</span>
    <span id="anchor55519b440.497258519054045">the</span>
    <span id="anchor55521b450.16396800343132">annotation</span>
    <span id="anchor55524b460.830011833845643">is</span>
    <span id="anchor55526b470.888948750164802">marked</span>
    <span id="anchor55528b480.0769946808353973">as</span>
    <span id="anchor55531b490.649706986104002">a</span>
    <span id="anchor55533b500.248044118400684">note</span>
    <span id="anchor55536b510.629479703320879">with</span>
    <span id="anchor55538b520.229136979779758">a</span>
    <span id="anchor55540b530.70061996472097">link</span>
    <span id="anchor55543b540.316867137475343">to</span>
    <span id="anchor55545b550.328777043301974">the</span>
    <span id="anchor55548b560.231427952289315">notes.</span>
    <span id="anchor55550b570.0741609698506822">You</span>
    <span id="anchor55552b580.633072193541132">may</span>
    <span id="anchor55555b590.223656413249511">read</span>
    <span id="anchor55557b600.651132082404165">the</span>
    <span id="anchor55560b610.510685971244558">annotation</span>
    <span id="anchor55562b620.971465709605937">when</span>
    <span id="anchor55564b630.280042013283839">your</span>
    <span id="anchor55567b640.546106877991048">mouse</span>
    <span id="anchor55569b650.719268576111304">is</span>
    <span id="anchor55572b660.113280554820448">over</span>
    <span id="anchor55574b670.47148342918208">the</span>
    <span id="anchor55576b680.592539918884886">link.</span></p>
        <p id="anchor54234a7">
    <span id="anchor54570b10.944318096127509">Is</span>
    <span id="anchor54563b20.450917558023202">this</span>
    <span id="anchor55280b30.336351125657722">a</span>
    <span id="anchor55283b40.847684435941132">good</span>
    <span id="anchor55285b50.434513295737334">idea?</span>
    <span id="anchor55287b60.00323145976440583">Do</span>
    <span id="anchor55289b70.344942954995177">you</span>
    <span id="anchor55291b80.598481299634316">like</span>
    <span id="anchor55232b90.83324329407571">it?</span>
    <span id="anchor55235b100.233891704694318">Should</span>
    <span id="anchor55237b110.675475980469713">all</span>
    <span id="anchor55241b120.482950279714051">my</span>
    <span id="anchor55243b130.481935823095001">pages</span>
    <span id="anchor55247b140.304955683324931">have</span>
    <span id="anchor55249b150.71208725995947">user</span>
    <span id="anchor55251b160.18255578735031">supplied</span>
    <span id="anchor55254b170.621822821265935">foot</span>
    <span id="anchor55256b180.0408643027957828">notes?</span></p>
        <h2 id="anchor54238a8">
    <span id="anchor55576b10.413983739639625">How</span>
    <span id="anchor54562b20.695983791116618">is</span>
    <span id="anchor55568b30.673936496336915">it</span>
    <span id="anchor55570b40.637640152889136">done</span></h2>
        <p id="anchor55018b510.584488500647474">
    <span id="anchor55571b10.347115873055121">In</span>
    <span id="anchor55241b20.184622467581473">order</span>
    <span id="anchor55279b30.609105862029412">to</span>
    <span id="anchor55282b40.627157886338959">add</span>
    <span id="anchor55284b50.730729345572521">footnotes</span>
    <span id="anchor55286b60.328374438140716">to</span>
    <span id="anchor55288b70.740438441159408">a</span>
    <span id="anchor55290b80.20221277428894">text,</span>
    <span id="anchor55982b90.920914357025602">we</span>
    <span id="anchor55984b100.684756536821256">need</span>
    <span id="anchor55986b110.653130332312142">to</span>
    <span id="anchor55990b120.257265482217663">be</span>
    <span id="anchor55992b130.532440972762388">able</span>
    <span id="anchor55994b140.0876436280494759">to</span>
    <span id="anchor55996b150.26049694244773">address</span>
    <span id="anchor55998b160.877383927757565">individual</span>
    <span id="anchor56000b170.686124927683792">positions</span>
    <span id="anchor56002b180.0937402360577789">in</span>
    <span id="anchor56005b190.111275631986221">it.</span>
    <span id="anchor56007b200.361600907687843">These</span>
    <span id="anchor56009b210.57669051577183">positions</span>
    <span id="anchor55988b220.593211455081222">are</span>
    <span id="anchor56015b230.666556591012774">what</span>
    <span id="anchor56017b240.288777775265639">I'd</span>
    <span id="anchor56019b250.775767242897194">like</span>
    <span id="anchor56021b260.288379411813048">to</span>
    <span id="anchor56024b270.329642078527083">call</span>
    <span id="anchor56026b280.189750982071157">annotation</span>
    <span id="anchor56028b290.984363202929666">anchors.</span>
    <span id="anchor56031b300.00357857439833627">I've</span>
    <span id="anchor56033b310.827391135425955">already</span>
    <span id="anchor56036b320.331479075519125">briefly</span>
    <span id="anchor56038b330.188201041979809">discussed</span>
    <span id="anchor56040b340.436496996989705">the</span>
    <span id="anchor56043b350.958636961858085">problem</span>
    <span id="anchor56045b360.918930388017991">on</span>
    <span id="anchor56048b370.764871435130421">how</span>
    <span id="anchor56050b380.699075403017493">to</span>
    <span id="anchor56052b390.121143161841269">create</span>
    <span id="anchor56055b400.685785791690362">identifiers</span>
    <span id="anchor56057b410.383831939373087">(see</span>
    <span id="anchor56011b420.774273494619072">a</span> <a id="anchor54248d30.943051274373686" href="http://sigfrid-lundberg.se/entries/2009/08/quotations/">A
      quotation is much more than an extract</a>
    <span id="anchor56061b10.916272912135475">).</span>
    <span id="anchor56063b20.861917122668548">For</span>
    <span id="anchor55982b30.203548216355754">this</span>
    <span id="anchor55984b40.793656839427378">entry</span>
    <span id="anchor55986b50.548042049886678">I've</span>
    <span id="anchor55988b60.297288452413533">extended</span>
    <span id="anchor56015b70.9049324714136">the</span>
    <span id="anchor56017b80.909642957574522">xslt</span>
    <span id="anchor56019b90.873978968185363">script</span>
    <span id="anchor56021b100.498143926494822">such</span>
    <span id="anchor55279b110.576199548121635">that</span>
    <span id="anchor55283b120.162756743451001">it</span>
    <span id="anchor55286b130.273911168926354">can</span> <a id="anchor54255d50.864578960400344" href="http://exslt.org/str/functions/tokenize/">tokenize</a>
    <span id="anchor55988b10.492398821978084">html</span>
    <span id="anchor55983b20.463662150997511">text</span>
    <span id="anchor56015b30.848942162864349">embedded</span>
    <span id="anchor56017b40.49597739637642">in</span>
    <span id="anchor56019b50.291053285957805">atom</span>
    <span id="anchor56021b60.180421238383474">entry</span>
    <span id="anchor56318b70.684178438821891">documents.</span>
    <span id="anchor56320b80.727550283413171">It</span>
    <span id="anchor56322b90.139058199775898">can</span>
    <span id="anchor56325b100.60310882637422">also</span>
    <span id="anchor56327b110.492421718077931">add</span>
    <span id="anchor56330b120.838133602793391">anchors</span>
    <span id="anchor56332b130.724251988215489">(id</span>
    <span id="anchor56335b140.178207509768292">attributes)</span>
    <span id="anchor56337b150.221965542166478">on</span>
    <span id="anchor56339b160.4985254823689">each</span>
    <span id="anchor56341b170.121258783676316">individual</span>
    <span id="anchor56343b180.138238453836291">word</span>
    <span id="anchor56345b190.360442604571787">(produced</span>
    <span id="anchor56347b200.324807000032071">by</span>
    <span id="anchor56350b210.931895293729331">the</span>
    <span id="anchor56329b220.908484654458465">tokenize</span>
    <span id="anchor56356b230.622095452445604">function)</span>
    <span id="anchor56358b240.836827764677269">in</span>
    <span id="anchor56360b250.818127611567326">the</span>
    <span id="anchor56362b260.496074420165305">whole</span>
    <span id="anchor56364b270.33497169070643">text.</span>
    <span id="anchor56366b280.39432715968896">We</span>
    <span id="anchor56368b290.658831163616307">also</span>
    <span id="anchor56370b300.608882859632784">implement</span>
    <span id="anchor56373b310.258906119623643">a</span>
    <span id="anchor56375b320.15122998512873">javascript</span>
    <span id="anchor56378b330.0725450106302952">which</span>
    <span id="anchor56380b340.107848282022331">expose</span>
    <span id="anchor56382b350.647207381970811">these</span>
    <span id="anchor56385b360.3635982965881">anchors</span>
    <span id="anchor56387b370.288269520405805">to</span>
    <span id="anchor56390b380.331385820327041">users,</span>
    <span id="anchor56392b390.0911485795356094">and</span>
    <span id="anchor56394b400.427327720647365">allow</span>
    <span id="anchor56397b410.934494646701261">them</span>
    <span id="anchor56352b420.583570298079201">to</span>
    <span id="anchor56405b430.265461322975094">comment</span>
    <span id="anchor56407b440.658746634451089">more</span>
    <span id="anchor56409b450.761777807847493">or</span>
    <span id="anchor56412b460.487426865141572">less</span>
    <span id="anchor56414b470.157272116819989">arbitrary</span>
    <span id="anchor56416b480.88303659152381">point</span>
    <span id="anchor56419b490.625665319443525">in</span>
    <span id="anchor56421b500.517714721391776">the</span>
    <span id="anchor56424b510.207843591090219">text.</span></p>
        <p id="anchor55402b10.359095368701543">
    <span id="anchor56376b10.557560612707194">There</span>
    <span id="anchor56378b20.426199375850241">is</span>
    <span id="anchor56381b30.829939043535823">a</span><strong id="anchor54271a3">
    <span id="anchor56421b10.394388376918802">big</span></strong>
    <span id="anchor56420b10.244326986951906"/>
    <span id="anchor56015b20.326013463235466">drawback</span>
    <span id="anchor56017b30.729360068090893">in</span>
    <span id="anchor56019b40.638654146640866">this</span>
    <span id="anchor56021b50.984844627317434">procedure;</span>
    <span id="anchor56318b60.338242927258016">once</span>
    <span id="anchor56320b70.89756026626451">you</span>
    <span id="anchor56322b80.136074611980503">have</span>
    <span id="anchor56325b90.410787937888311">processed</span>
    <span id="anchor56327b100.00540854828684057">your</span>
    <span id="anchor56329b110.783281993951314">text</span>
    <span id="anchor56357b120.774386234942072">and</span>
    <span id="anchor56359b130.293678068692646">the</span>
    <span id="anchor56361b140.114667813812693">anchors</span>
    <span id="anchor56363b150.865534814477682">are</span>
    <span id="anchor56366b160.721005789340011">there,</span>
    <span id="anchor56368b170.049162460048293">then</span>
    <span id="anchor56370b180.449105112091221">you</span><strong id="anchor54275a5">
    <span id="anchor56371b10.986467112780766">must</span>
    <span id="anchor56017b20.707909094965043">not</span></strong>
    <span id="anchor56370b10.210882919473053">change</span>
    <span id="anchor56017b20.473893977456677">them.</span>
    <span id="anchor56325b30.865181211785032">Each</span>
    <span id="anchor56327b40.0939195105312017">word</span>
    <span id="anchor56354b50.09955929643454">has</span>
    <span id="anchor56357b60.382895932711147">become</span>
    <span id="anchor56359b70.301763101621421">a</span>
    <span id="anchor56361b80.657119909141734">resource</span>
    <span id="anchor56363b90.809095308561388">on</span>
    <span id="anchor56365b100.131702144691582">the</span>
    <span id="anchor56774b110.0515082860605364">internet.</span>
    <span id="anchor56778b120.0534222955132938">Please</span>
    <span id="anchor56780b130.45771560839271">view</span>
    <span id="anchor56782b140.78086835415143">the</span>
    <span id="anchor56784b150.69207644215416">source</span>
    <span id="anchor56786b160.442560235244483">of</span>
    <span id="anchor56788b170.119111280943785">this</span>
    <span id="anchor56791b180.58963670841867">document,</span>
    <span id="anchor56793b190.578634847224986">before</span>
    <span id="anchor56795b200.529899219297757">you</span>
    <span id="anchor56797b210.59504525670551">use</span>
    <span id="anchor56776b220.3619168411763">the</span>
    <span id="anchor56803b230.304285453774168">stylesheet</span><kbd id="anchor54280a7"> <a id="anchor54281d10.888723325398156" href="http://sigfrid-lundberg.se/footnotes/atom_anchor_id.xsl">atom_anchor_id.xsl</a></kbd>
    <span id="anchor56774b10.476584654988993">.</span></p>
        <pre id="anchor54288c110.169820267786188">
	&lt;span id="anchor54764"&gt;Would&lt;/span&gt;
	&lt;span id="anchor54766"&gt;you&lt;/span&gt;
	&lt;span id="anchor54768"&gt;like&lt;/span&gt;
	&lt;span id="anchor54770"&gt;to&lt;/span&gt;
	&lt;span id="anchor54772"&gt;edit&lt;/span&gt;
	&lt;span id="anchor54774"&gt;this&lt;/span&gt;
	&lt;span id="anchor54778"&gt;text?&lt;/span&gt;
      </pre>
        <p id="anchor54295a12">
    <span id="anchor56781b10.609729114738167">See</span>
    <span id="anchor56786b20.525747115502948">what</span>
    <span id="anchor56789b30.618925380343071">I</span>
    <span id="anchor56791b40.596196227053272">mean?</span>
    <span id="anchor56793b50.233656210002329">I</span>
    <span id="anchor56795b60.829808299816124">cannot</span>
    <span id="anchor56797b70.0700902040442872">create</span>
    <span id="anchor56799b80.0988374213217001">prose</span>
    <span id="anchor56801b90.923727810812987">like</span>
    <span id="anchor56804b100.169649500944488">that</span>
    <span id="anchor56944b110.481733354032847">in</span>
    <span id="anchor56948b120.225490911968747">my</span>
    <span id="anchor56950b130.826769410086223">XML</span>
    <span id="anchor56952b140.290828662594235">editor.</span>
    <span id="anchor56954b150.35719305712599">You</span>
    <span id="anchor56956b160.878277696146759">wouldn't</span>
    <span id="anchor56958b170.344250958107529">suffer</span>
    <span id="anchor56961b180.8149086655187">as</span>
    <span id="anchor56963b190.659146049832528">much</span>
    <span id="anchor56965b200.0363273997960274">using</span>
    <span id="anchor56967b210.257468900297521">WYSIWYG</span>
    <span id="anchor56946b220.778257331241973">tools,</span>
    <span id="anchor56973b230.625964108214697">but</span>
    <span id="anchor56975b240.836103747522507">on</span>
    <span id="anchor56977b250.308156550074069">the</span>
    <span id="anchor56979b260.221009364454546">hand</span>
    <span id="anchor56982b270.198020588233145">it</span>
    <span id="anchor56984b280.612442003848237">would</span>
    <span id="anchor56986b290.109732689852702">presumably</span>
    <span id="anchor56989b300.6746052436878">destroy</span>
    <span id="anchor56991b310.782262271634425">the</span>
    <span id="anchor56994b320.719461804590869">is-strings.</span></p>
        <h2 id="anchor54300a13">
    <span id="anchor56943b10.200352358725086">Javascript</span>
    <span id="anchor56946b20.401187651511835">&amp;</span>
    <span id="anchor56787b30.315658031178479">DOM</span>
    <span id="anchor56789b40.434008568727415">scripting</span></h2>
        <p id="anchor54304a14">
    <span id="anchor56786b10.230995951327959">You</span>
    <span id="anchor56789b20.385748235222766">can</span>
    <span id="anchor56956b30.532845990049115">find</span>
    <span id="anchor56958b40.154723761675285">the</span>
    <span id="anchor56960b50.555397736167255">possible</span>
    <span id="anchor56962b60.0145793436163009">anchors</span>
    <span id="anchor56965b70.380214673644032">by</span>
    <span id="anchor56967b80.382167146253477">clicking</span>
    <span id="anchor56969b90.305408006210536">on</span>
    <span id="anchor56971b100.737407730770022">the</span>
    <span id="anchor56973b110.260444841934575">link</span><strong id="anchor54306a2">
    <span id="anchor56956b10.649658964318064">Show</span>
    <span id="anchor56959b20.55231639582306">anchors</span></strong>
    <span id="anchor56972b10.919590892232764">,</span>
    <span id="anchor56955b20.685986364579753">and</span>
    <span id="anchor56957b30.809785296120581">hide</span>
    <span id="anchor56959b40.697848223009076">them</span>
    <span id="anchor57225b50.311950472328789">again</span>
    <span id="anchor57228b60.645889043643088">by</span>
    <span id="anchor57230b70.00600477261748387">clicking</span>
    <span id="anchor57232b80.532959837248996">on</span><strong id="anchor54310a4">
    <span id="anchor56958b10.843909631876233">Hide</span>
    <span id="anchor57224b20.618446776465721">anchors</span></strong>
    <span id="anchor56958b10.642692527101698">at</span>
    <span id="anchor57225b20.518514875098371">the</span>
    <span id="anchor57285b30.400709047634485">same</span>
    <span id="anchor57287b40.362154331226905">place</span>
    <span id="anchor57289b50.718867233823457">(there</span>
    <span id="anchor57291b60.801896699611981">is</span>
    <span id="anchor57293b70.677812362405384">a</span>
    <span id="anchor57296b80.152875802085211">toggle).</span>
    <span id="anchor57298b90.0328926504742786">There</span>
    <span id="anchor57300b100.0635605971624891">are</span>
    <span id="anchor57302b110.685721792134327">two</span>
    <span id="anchor57306b120.187616412149564">javascript</span>
    <span id="anchor57308b130.618958333795405">functions</span>
    <span id="anchor57310b140.700301136216289">handling</span>
    <span id="anchor57312b150.567831085793595">the</span>
    <span id="anchor57314b160.00112547958322125">toggling.</span>
    <span id="anchor57316b170.00570914196116344">The</span>
    <span id="anchor57318b180.305238816563617">possibly</span>
    <span id="anchor57321b190.261570321517796">most</span>
    <span id="anchor57323b200.655368106744889">interesting</span>
    <span id="anchor57326b210.857555212386677">feature</span>
    <span id="anchor57304b220.181161213284899">is</span>
    <span id="anchor57332b230.341354470858981">the</span>
    <span id="anchor57334b240.667340508507258">generation</span>
    <span id="anchor57337b250.879009436293975">of</span>
    <span id="anchor57339b260.65330494318777">javascript</span>
    <span id="anchor57341b270.313229551684684">from</span>
    <span id="anchor57344b280.885014208911459">rss</span>
    <span id="anchor57346b290.186264779971104">for</span>
    <span id="anchor57349b300.157139183095255">handling</span>
    <span id="anchor57351b310.503460984911519">entering</span>
    <span id="anchor57353b320.828957307072802">the</span>
    <span id="anchor57356b330.675654058659288">readable</span>
    <span id="anchor57358b340.904170033011665">notes</span></p>
        <pre id="anchor54317c150.191111637834046">
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
        <p id="anchor54331a16">
    <span id="anchor57293b10.394521292017084">There</span>
    <span id="anchor57297b20.706066732157984">are</span>
    <span id="anchor57300b30.86892400023943">some</span>
    <span id="anchor57302b40.547397094567957">limitations;</span>
    <span id="anchor57304b50.738959382632263">for</span>
    <span id="anchor57307b60.93248459786758">instance,</span>
    <span id="anchor57309b70.233118886236622">one</span>
    <span id="anchor57311b80.926575794781826">cannot</span>
    <span id="anchor57313b90.551442931197324">embed</span>
    <span id="anchor57315b100.933420022452911">hyportext</span>
    <span id="anchor57317b110.49440688010976">links</span>
    <span id="anchor57321b120.552568410780546">in</span>
    <span id="anchor57323b130.939129164879736">other</span>
    <span id="anchor57325b140.799645696673377">links.</span>
    <span id="anchor57328b150.814138732298342">It's</span>
    <span id="anchor57330b160.594497271158964">invalid</span>
    <span id="anchor57332b170.657200909060054">HTML,</span>
    <span id="anchor57335b180.995299946048902">and</span>
    <span id="anchor57337b190.935851742017945">doesn't</span>
    <span id="anchor57340b200.32454141710165">work</span>
    <span id="anchor57342b210.874309381877216">as</span>
    <span id="anchor57319b220.589156684740054">expected.</span></p>
        <p id="anchor54336a17">
    <span id="anchor57346b10.637770968786334">The</span>
    <span id="anchor57300b20.759323590788675">rest</span>
    <span id="anchor57302b30.77542146517682">of</span>
    <span id="anchor57306b40.79491015188159">the</span>
    <span id="anchor57308b50.262784575234533">features</span>
    <span id="anchor57310b60.60437877178396">are</span>
    <span id="anchor57312b70.470564210075216">readily</span>
    <span id="anchor57314b80.166954607780536">visible</span>
    <span id="anchor57316b90.795490410083668">on</span>
    <span id="anchor57318b100.865085502557962">this</span>
    <span id="anchor57321b110.87302133993852">page.</span>
    <span id="anchor57324b120.664414409857436">You</span>
    <span id="anchor57327b130.412482596660258">have</span>
    <span id="anchor57329b140.611980722105122">to</span>
    <span id="anchor57331b150.596899007259355">reaload</span>
    <span id="anchor57334b160.64560148289688">the</span>
    <span id="anchor57336b170.538556516421287">page</span>
    <span id="anchor57339b180.148341937991018">to</span>
    <span id="anchor57341b190.579021505349791">see</span>
    <span id="anchor57676b200.032963396531047">the</span>
    <span id="anchor57678b210.700910348771564">new</span>
    <span id="anchor57323b220.518150669763866">footnote</span>
    <span id="anchor57684b230.832609093204424">--</span>
    <span id="anchor57687b240.515049081069906">if</span>
    <span id="anchor57689b250.112647940457169">I</span>
    <span id="anchor57691b260.489810001798817">implement</span>
    <span id="anchor57693b270.510349026653147">this</span>
    <span id="anchor57695b280.0484996820094528">I'll</span>
    <span id="anchor57697b290.814351418900467">will</span>
    <span id="anchor57699b300.384658408064702">refresh</span>
    <span id="anchor57702b310.637656366749507">those</span>
    <span id="anchor57704b320.45212238722114">asynchronously.</span></p>
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
    </div>
    <script type="text/javascript">//<!--//--></script>
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
