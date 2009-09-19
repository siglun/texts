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
    <span id="anchor54362b60.197551369293384">the</span>
    <span id="anchor54365b70.335222755714889">top</span>
    <span id="anchor54367b80.768229594811904">of</span>
    <span id="anchor54369b90.277774710803188">this</span>
    <span id="anchor54371b100.553969955795431">page.</span>
    <span id="anchor54374b110.47739705186216">It</span>
    <span id="anchor54378b120.628870924761924">says</span><q id="anchor54189a2"><strong id="anchor54190a1">
    <span id="anchor54128b10.364784472791843">Show</span>
    <span id="anchor54131b20.513400910195616">Anchors</span></strong></q>
    <span id="anchor54371b10.952229725174713">.</span>
    <span id="anchor54130b20.916195068003701">It's</span>
    <span id="anchor54127b30.635711727959901">not</span>
    <span id="anchor54442b40.717296929432683">a</span>
    <span id="anchor54449b50.141602555355803">very</span>
    <span id="anchor54451b60.606968876257059">user</span>
    <span id="anchor54453b70.0163005716243296">friendly</span>
    <span id="anchor54455b80.242886770629737">description</span>
    <span id="anchor54457b90.137231576786019">of</span>
    <span id="anchor54459b100.80417675422699">what</span>
    <span id="anchor54461b110.156679089254085">it</span>
    <span id="anchor54465b120.400944394246183">does,</span>
    <span id="anchor54467b130.129790446781456">but</span>
    <span id="anchor54469b140.108808802025769">I</span>
    <span id="anchor54471b150.998924518003559">cannot</span>
    <span id="anchor54474b160.218256905310907">figure</span>
    <span id="anchor54476b170.512932394404398">out</span>
    <span id="anchor54478b180.839112234692607">a</span>
    <span id="anchor54480b190.612639832595661">better</span>
    <span id="anchor54482b200.296031617697343">term</span>
    <span id="anchor54484b210.637552267703019">right</span>
    <span id="anchor54464b220.524287190066784">now.</span>
    <span id="anchor54490b230.493582986990727">If</span>
    <span id="anchor54492b240.97277502388357">you</span>
    <span id="anchor54495b250.292516784413027">click</span>
    <span id="anchor54497b260.771357697793915">on</span>
    <span id="anchor54500b270.526744979213339">it,</span>
    <span id="anchor54502b280.769913836275187">there</span>
    <span id="anchor54504b290.400228622090178">will</span>
    <span id="anchor54507b300.891529452005182">appear</span>
    <span id="anchor54509b310.283314746005142">a</span>
    <span id="anchor54512b320.352458347264891">link</span>
    <span id="anchor54514b330.807724520008883">after</span>
    <span id="anchor54516b340.919026473965042">most</span>
    <span id="anchor54519b350.0697552762319126">words</span>
    <span id="anchor54521b360.949327075364686">in</span>
    <span id="anchor54524b370.525995350222101">the</span>
    <span id="anchor54526b380.0860558478562421">text.</span>
    <span id="anchor54528b390.192213845994423">These</span>
    <span id="anchor54531b400.66322692700812">are</span>
    <span id="anchor54533b410.890232602548894">the</span>
    <span id="anchor54486b420.348892935248508">annotation</span>
    <span id="anchor54541b430.0641713207886421">anchors.</span>
    <span id="anchor54543b440.0200230488646883">When</span>
    <span id="anchor54546b450.457701737274277">visible,</span>
    <span id="anchor54548b460.0630958383265398">the</span>
    <span id="anchor54550b470.238279954175595">anchors</span>
    <span id="anchor54553b480.970634131678675">appears</span>
    <span id="anchor54555b490.902208073484808">as</span>
    <span id="anchor54558b500.850919786771256">a</span>
    <span id="anchor54560b510.266665749376018">clickable</span>
    <span id="anchor54562b520.539760340722166">asterisk</span>
    <span id="anchor54565b530.375206976372379">'*',</span>
    <span id="anchor54567b540.760248736366745">and</span>
    <span id="anchor54570b550.512535364140074">click</span>
    <span id="anchor54572b560.667723760785406">on</span>
    <span id="anchor54574b570.53160643416066">one</span>
    <span id="anchor54577b580.0392803433534132">of</span>
    <span id="anchor54579b590.437637596594932">them</span>
    <span id="anchor54582b600.931835056250838">activates</span>
    <span id="anchor54584b610.930809795358595">the</span>
    <span id="anchor54586b620.720952343065735">usual</span> <a id="anchor54197d40.284293403050068" href="http://disqus.com">disqus.com forum</a>
    <span id="anchor54127b10.738534314901817">.</span></p>
        <p id="anchor54204a2">
    <span id="anchor54452b10.639978816565116">Submitting</span>
    <span id="anchor54457b20.354048679747641">a</span>
    <span id="anchor54460b30.687861390266503">footnote</span>
    <span id="anchor54462b40.165974166321556">works,</span>
    <span id="anchor54465b50.440104527603884">but</span>
    <span id="anchor54467b60.880075236260926">the</span>
    <span id="anchor54470b70.829201093329676">script</span>
    <span id="anchor54472b80.330337129687116">never</span>
    <span id="anchor54475b90.228968171043772">get</span>
    <span id="anchor54477b100.893372414583979">the</span>
    <span id="anchor54479b110.350360178551804">acknowledgement</span>
    <span id="anchor54483b120.686669908318049">from</span>
    <span id="anchor54486b130.956468252910519">the</span>
    <span id="anchor54489b140.588640133193061">disqus.com</span>
    <span id="anchor54492b150.657304039531063">server.</span>
    <span id="anchor54494b160.858676325929666">I</span>
    <span id="anchor54496b170.439559919498656">don't</span>
    <span id="anchor54499b180.923969788907082">know</span>
    <span id="anchor54501b190.398436666651832">why,</span>
    <span id="anchor54504b200.814766896336697">but</span>
    <span id="anchor54506b210.684218525273827">it</span>
    <span id="anchor54482b220.910972030791907">seems</span>
    <span id="anchor54512b230.482490656656442">that</span>
    <span id="anchor54515b240.215824958968826">the</span>
    <span id="anchor54517b250.95025237414532">form</span>
    <span id="anchor54520b260.920128253717035">doesn't</span>
    <span id="anchor54522b270.147660014754003">like</span>
    <span id="anchor54524b280.881062169503915">to</span>
    <span id="anchor54527b290.641080596317109">live</span>
    <span id="anchor54529b300.431953418269732">in</span>
    <span id="anchor54532b310.619596483940071">an</span>
    <span id="anchor54534b320.281059412416564">iframe.</span></p>
        <p id="anchor55576b680.592539918884886">
    <span id="anchor54462b10.786002098017373">My</span>
    <span id="anchor54465b20.307457873740912">server</span>
    <span id="anchor54467b30.447033579203781">retrieves</span>
    <span id="anchor54470b40.226106625155595">the</span>
    <span id="anchor54472b50.187533109536177">annotations</span>
    <span id="anchor54475b60.276234672067796">from</span>
    <span id="anchor54477b70.556443755308373">the</span>
    <span id="anchor54479b80.416501280579949">disqus.com</span>
    <span id="anchor54483b90.169607086186114">web</span>
    <span id="anchor54486b100.906803933860177">services</span>
    <span id="anchor54489b110.103171188432337">and</span>
    <span id="anchor54494b120.126075339096633">print</span>
    <span id="anchor54496b130.495444066587577">a</span>
    <span id="anchor54499b140.760475228429062">list</span>
    <span id="anchor54501b150.9847516650263">of</span>
    <span id="anchor54504b160.935003986551894">notes</span>
    <span id="anchor54506b170.684445016870482">at</span>
    <span id="anchor54512b180.38318833121247">the</span>
    <span id="anchor54515b190.749770882422929">end</span>
    <span id="anchor54517b200.368663541678648">of</span>
    <span id="anchor54520b210.294160362004377">the</span>
    <span id="anchor54511b220.232261538613709">page.</span>
    <span id="anchor54523b230.584488500647474">This</span>
    <span id="anchor54526b240.244412735684036">is</span>
    <span id="anchor54528b250.152389791865083">done</span>
    <span id="anchor54530b260.732148515867138">server</span>
    <span id="anchor54533b270.12547490472229">side,</span>
    <span id="anchor54535b280.793470388182192">such</span>
    <span id="anchor54493b290.164101933671209">that</span>
    <span id="anchor55160b300.745071389128022">the</span>
    <span id="anchor55162b310.0745298005987563">discussions</span>
    <span id="anchor55164b320.950104031688582">within</span>
    <span id="anchor55166b330.0525292624032727">the</span>
    <span id="anchor55168b340.521563379802538">footnotes</span>
    <span id="anchor55170b350.176210656378516">will</span>
    <span id="anchor55172b360.240062372405111">be</span>
    <span id="anchor55175b370.797798051870334">visible</span>
    <span id="anchor55177b380.732654411686889">by</span>
    <span id="anchor55179b390.65656365298506">search</span>
    <span id="anchor55181b400.96740513852211">engines.</span>
    <span id="anchor55183b410.639458345547066">The</span>
    <span id="anchor54508b420.759734841883059">place</span>
    <span id="anchor55191b430.0934804771530817">of</span>
    <span id="anchor55193b440.134902411668982">the</span>
    <span id="anchor55196b450.52021006984646">annotation</span>
    <span id="anchor55198b460.0782321417137199">is</span>
    <span id="anchor55200b470.0699063977552142">marked</span>
    <span id="anchor55203b480.204655086251281">as</span>
    <span id="anchor55205b490.461420473391852">a</span>
    <span id="anchor55208b500.819677280178143">note</span>
    <span id="anchor55210b510.57331862839559">with</span>
    <span id="anchor55212b520.755580835396229">a</span>
    <span id="anchor55215b530.0519388187918527">link</span>
    <span id="anchor55217b540.157807128577403">to</span>
    <span id="anchor55220b550.999993571080264">the</span>
    <span id="anchor55222b560.204328610656936">notes.</span>
    <span id="anchor55224b570.889955644444542">You</span>
    <span id="anchor55227b580.125468475802554">may</span>
    <span id="anchor55229b590.99779899930479">read</span>
    <span id="anchor55232b600.0540575776500896">the</span>
    <span id="anchor55234b610.870539864930576">annotation</span>
    <span id="anchor55236b620.0723287994378846">when</span>
    <span id="anchor55239b630.00416160887301043">your</span>
    <span id="anchor55241b640.923069127333848">mouse</span>
    <span id="anchor55244b650.593892179240422">is</span>
    <span id="anchor55246b660.180372265717188">over</span>
    <span id="anchor55248b670.163131499273298">the</span>
    <span id="anchor55251b680.391690230645095">link.</span></p>
        <p id="anchor54218a4">
    <span id="anchor54532b10.913026677404077">Is</span>
    <span id="anchor54535b20.81969515272402">this</span>
    <span id="anchor54484b30.359095368701543">a</span>
    <span id="anchor54486b40.552485022485482">good</span>
    <span id="anchor54466b50.579429994141418">idea?</span>
    <span id="anchor54468b60.452575845854625">Do</span>
    <span id="anchor54471b70.687387434620125">you</span>
    <span id="anchor54473b80.099640063522216">like</span>
    <span id="anchor54475b90.530807988034006">it?</span>
    <span id="anchor54478b100.757293832375339">Should</span>
    <span id="anchor54480b110.304295149773497">all</span>
    <span id="anchor54514b120.992228461425858">my</span>
    <span id="anchor54516b130.576971112553482">pages</span>
    <span id="anchor54518b140.877613778169087">have</span>
    <span id="anchor54521b150.747809296356425">user</span>
    <span id="anchor54523b160.628909931345335">supplied</span>
    <span id="anchor54526b170.0354209067464904">foot</span>
    <span id="anchor54528b180.747802866971028">notes?</span></p>
        <h2 id="anchor54222a5">
    <span id="anchor54483b10.833238542002271">How</span>
    <span id="anchor54486b20.925376551191032">is</span>
    <span id="anchor54533b30.873271342773582">it</span>
    <span id="anchor54535b40.831037540841399">done</span></h2>
        <p id="anchor55018b510.584488500647474">
    <span id="anchor54529b10.979434129306783">In</span>
    <span id="anchor54534b20.743811207238497">order</span>
    <span id="anchor54512b30.903366340279284">to</span>
    <span id="anchor54514b40.983595738179794">add</span>
    <span id="anchor54516b50.666880334572345">footnotes</span>
    <span id="anchor54519b60.497258519054045">to</span>
    <span id="anchor54521b70.16396800343132">a</span>
    <span id="anchor54523b80.830011833845643">text,</span>
    <span id="anchor54526b90.888948750164802">we</span>
    <span id="anchor55656b100.0769946808353973">need</span>
    <span id="anchor55658b110.649706986104002">to</span>
    <span id="anchor55662b120.248044118400684">be</span>
    <span id="anchor55664b130.629479703320879">able</span>
    <span id="anchor55666b140.229136979779758">to</span>
    <span id="anchor55668b150.70061996472097">address</span>
    <span id="anchor55671b160.316867137475343">individual</span>
    <span id="anchor55673b170.328777043301974">positions</span>
    <span id="anchor55676b180.231427952289315">in</span>
    <span id="anchor55678b190.0741609698506822">it.</span>
    <span id="anchor55680b200.633072193541132">These</span>
    <span id="anchor55683b210.223656413249511">positions</span>
    <span id="anchor55661b220.651132082404165">are</span>
    <span id="anchor55689b230.510685971244558">what</span>
    <span id="anchor55692b240.971465709605937">I'd</span>
    <span id="anchor55694b250.280042013283839">like</span>
    <span id="anchor55696b260.546106877991048">to</span>
    <span id="anchor55699b270.719268576111304">call</span>
    <span id="anchor55701b280.113280554820448">annotation</span>
    <span id="anchor55704b290.47148342918208">anchors.</span>
    <span id="anchor55706b300.592539918884886">I've</span>
    <span id="anchor55708b310.944318096127509">already</span>
    <span id="anchor55711b320.450917558023202">briefly</span>
    <span id="anchor55713b330.336351125657722">discussed</span>
    <span id="anchor55716b340.847684435941132">the</span>
    <span id="anchor55718b350.434513295737334">problem</span>
    <span id="anchor55720b360.00323145976440583">on</span>
    <span id="anchor55723b370.344942954995177">how</span>
    <span id="anchor55725b380.598481299634316">to</span>
    <span id="anchor55728b390.83324329407571">create</span>
    <span id="anchor55730b400.233891704694318">identifiers</span>
    <span id="anchor55732b410.675475980469713">(see</span>
    <span id="anchor55685b420.482950279714051">a</span> <a id="anchor54232d30.481935823095001" href="http://sigfrid-lundberg.se/entries/2009/08/quotations/">A
      quotation is much more than an extract</a>
    <span id="anchor55660b10.304955683324931">).</span>
    <span id="anchor55737b20.71208725995947">For</span>
    <span id="anchor55739b30.18255578735031">this</span>
    <span id="anchor54513b40.621822821265935">entry</span>
    <span id="anchor54515b50.0408643027957828">I've</span>
    <span id="anchor54518b60.413983739639625">extended</span>
    <span id="anchor54520b70.695983791116618">the</span>
    <span id="anchor54522b80.673936496336915">xslt</span>
    <span id="anchor54524b90.637640152889136">script</span>
    <span id="anchor54526b100.347115873055121">such</span>
    <span id="anchor55663b110.184622467581473">that</span>
    <span id="anchor55667b120.609105862029412">it</span>
    <span id="anchor55669b130.627157886338959">can</span> <a id="anchor54239d50.730729345572521" href="http://exslt.org/str/functions/tokenize/">tokenize</a>
    <span id="anchor55666b10.328374438140716">html</span>
    <span id="anchor55669b20.740438441159408">text</span>
    <span id="anchor54516b30.20221277428894">embedded</span>
    <span id="anchor54518b40.920914357025602">in</span>
    <span id="anchor54520b50.684756536821256">atom</span>
    <span id="anchor54523b60.653130332312142">entry</span>
    <span id="anchor54525b70.257265482217663">documents.</span>
    <span id="anchor55998b80.532440972762388">It</span>
    <span id="anchor56000b90.0876436280494759">can</span>
    <span id="anchor56002b100.26049694244773">also</span>
    <span id="anchor56005b110.877383927757565">add</span>
    <span id="anchor56008b120.686124927683792">anchors</span>
    <span id="anchor56010b130.0937402360577789">(id</span>
    <span id="anchor56012b140.111275631986221">attributes)</span>
    <span id="anchor56015b150.361600907687843">on</span>
    <span id="anchor56017b160.57669051577183">each</span>
    <span id="anchor56019b170.593211455081222">individual</span>
    <span id="anchor56021b180.666556591012774">word</span>
    <span id="anchor56023b190.288777775265639">(produced</span>
    <span id="anchor56025b200.775767242897194">by</span>
    <span id="anchor56027b210.288379411813048">the</span>
    <span id="anchor56007b220.329642078527083">tokenize</span>
    <span id="anchor56033b230.189750982071157">function)</span>
    <span id="anchor56036b240.984363202929666">in</span>
    <span id="anchor56038b250.00357857439833627">the</span>
    <span id="anchor56041b260.827391135425955">whole</span>
    <span id="anchor56043b270.331479075519125">text.</span>
    <span id="anchor56045b280.188201041979809">We</span>
    <span id="anchor56048b290.436496996989705">also</span>
    <span id="anchor56050b300.958636961858085">implement</span>
    <span id="anchor56053b310.918930388017991">a</span>
    <span id="anchor56055b320.764871435130421">javascript</span>
    <span id="anchor56057b330.699075403017493">which</span>
    <span id="anchor56060b340.121143161841269">expose</span>
    <span id="anchor56062b350.685785791690362">these</span>
    <span id="anchor56065b360.383831939373087">anchors</span>
    <span id="anchor56067b370.774273494619072">to</span>
    <span id="anchor56069b380.943051274373686">users,</span>
    <span id="anchor56072b390.916272912135475">and</span>
    <span id="anchor56074b400.861917122668548">allow</span>
    <span id="anchor56077b410.203548216355754">them</span>
    <span id="anchor56030b420.793656839427378">to</span>
    <span id="anchor56084b430.548042049886678">comment</span>
    <span id="anchor56087b440.297288452413533">more</span>
    <span id="anchor56089b450.9049324714136">or</span>
    <span id="anchor56091b460.909642957574522">less</span>
    <span id="anchor56094b470.873978968185363">arbitrary</span>
    <span id="anchor56096b480.498143926494822">point</span>
    <span id="anchor56099b490.576199548121635">in</span>
    <span id="anchor56101b500.162756743451001">the</span>
    <span id="anchor56103b510.273911168926354">text.</span></p>
        <p id="anchor55402b10.359095368701543">
    <span id="anchor56039b10.864578960400344">There</span>
    <span id="anchor56041b20.492398821978084">is</span>
    <span id="anchor56044b30.463662150997511">a</span><strong id="anchor54254a3">
    <span id="anchor56099b10.848942162864349">big</span></strong>
    <span id="anchor56043b10.49597739637642"/>
    <span id="anchor55998b20.291053285957805">drawback</span>
    <span id="anchor56000b30.180421238383474">in</span>
    <span id="anchor56002b40.684178438821891">this</span>
    <span id="anchor56005b50.727550283413171">procedure;</span>
    <span id="anchor56007b60.139058199775898">once</span>
    <span id="anchor54516b70.60310882637422">you</span>
    <span id="anchor54518b80.492421718077931">have</span>
    <span id="anchor54520b90.838133602793391">processed</span>
    <span id="anchor54523b100.724251988215489">your</span>
    <span id="anchor54525b110.178207509768292">text</span>
    <span id="anchor56010b120.221965542166478">and</span>
    <span id="anchor56012b130.4985254823689">the</span>
    <span id="anchor56014b140.121258783676316">anchors</span>
    <span id="anchor56016b150.138238453836291">are</span>
    <span id="anchor56018b160.360442604571787">there,</span>
    <span id="anchor56020b170.324807000032071">then</span>
    <span id="anchor56022b180.931895293729331">you</span><strong id="anchor54258a5">
    <span id="anchor56001b10.908484654458465">must</span>
    <span id="anchor56004b20.622095452445604">not</span></strong>
    <span id="anchor54525b10.836827764677269">change</span>
    <span id="anchor56002b20.818127611567326">them.</span>
    <span id="anchor56005b30.496074420165305">Each</span>
    <span id="anchor56009b40.33497169070643">word</span>
    <span id="anchor56011b50.39432715968896">has</span>
    <span id="anchor56014b60.658831163616307">become</span>
    <span id="anchor56016b70.608882859632784">a</span>
    <span id="anchor56018b80.258906119623643">resource</span>
    <span id="anchor56020b90.15122998512873">on</span>
    <span id="anchor56022b100.0725450106302952">the</span>
    <span id="anchor56454b110.107848282022331">internet.</span>
    <span id="anchor56457b120.647207381970811">Please</span>
    <span id="anchor56459b130.3635982965881">view</span>
    <span id="anchor56461b140.288269520405805">the</span>
    <span id="anchor56464b150.331385820327041">source</span>
    <span id="anchor56466b160.0911485795356094">of</span>
    <span id="anchor56468b170.427327720647365">this</span>
    <span id="anchor56470b180.934494646701261">document,</span>
    <span id="anchor56472b190.583570298079201">before</span>
    <span id="anchor56474b200.265461322975094">you</span>
    <span id="anchor56476b210.658746634451089">use</span>
    <span id="anchor56456b220.761777807847493">the</span>
    <span id="anchor56482b230.487426865141572">stylesheet</span><kbd id="anchor54263a7"> <a id="anchor54264d10.157272116819989" href="http://sigfrid-lundberg.se/footnotes/atom_anchor_id.xsl">atom_anchor_id.xsl</a></kbd>
    <span id="anchor56004b10.88303659152381">.</span></p>
        <pre id="anchor54271c80.625665319443525">
	&lt;span id="anchor54764"&gt;Would&lt;/span&gt;
	&lt;span id="anchor54766"&gt;you&lt;/span&gt;
	&lt;span id="anchor54768"&gt;like&lt;/span&gt;
	&lt;span id="anchor54770"&gt;to&lt;/span&gt;
	&lt;span id="anchor54772"&gt;edit&lt;/span&gt;
	&lt;span id="anchor54774"&gt;this&lt;/span&gt;
	&lt;span id="anchor54778"&gt;text?&lt;/span&gt;
      </pre>
        <p id="anchor54277a9">
    <span id="anchor56459b10.517714721391776">See</span>
    <span id="anchor56464b20.207843591090219">what</span>
    <span id="anchor56466b30.557560612707194">I</span>
    <span id="anchor56468b40.426199375850241">mean?</span>
    <span id="anchor56470b50.829939043535823">I</span>
    <span id="anchor56472b60.394388376918802">cannot</span>
    <span id="anchor56474b70.244326986951906">author</span>
    <span id="anchor56476b80.326013463235466">prose</span>
    <span id="anchor56479b90.729360068090893">like</span>
    <span id="anchor56481b100.638654146640866">that</span>
    <span id="anchor56483b110.984844627317434">in</span>
    <span id="anchor56621b120.338242927258016">my</span>
    <span id="anchor56623b130.89756026626451">XML</span>
    <span id="anchor56625b140.136074611980503">editor.</span>
    <span id="anchor56627b150.410787937888311">You</span>
    <span id="anchor56629b160.00540854828684057">wouldn't</span>
    <span id="anchor56631b170.783281993951314">suffer</span>
    <span id="anchor56634b180.774386234942072">as</span>
    <span id="anchor56636b190.293678068692646">much</span>
    <span id="anchor56638b200.114667813812693">using</span>
    <span id="anchor56640b210.865534814477682">WYSIWYG</span>
    <span id="anchor56619b220.721005789340011">tools,</span>
    <span id="anchor56646b230.049162460048293">but</span>
    <span id="anchor56649b240.449105112091221">on</span>
    <span id="anchor56651b250.986467112780766">the</span>
    <span id="anchor56654b260.707909094965043">hand</span>
    <span id="anchor56656b270.210882919473053">it</span>
    <span id="anchor56658b280.473893977456677">would</span>
    <span id="anchor56661b290.865181211785032">presumably</span>
    <span id="anchor56663b300.0939195105312017">destroy</span>
    <span id="anchor56666b310.09955929643454">the</span>
    <span id="anchor56668b320.382895932711147">ID-strings.</span></p>
        <p id="anchor54282a10">
    <span id="anchor56618b10.301763101621421">When</span>
    <span id="anchor56463b20.657119909141734">preparing</span>
    <span id="anchor56468b30.809095308561388">this</span>
    <span id="anchor56470b40.131702144691582">text,</span>
    <span id="anchor56473b50.0515082860605364">I</span>
    <span id="anchor56475b60.0534222955132938">felt</span>
    <span id="anchor56477b70.45771560839271">that</span>
    <span id="anchor56479b80.78086835415143">I</span>
    <span id="anchor56481b90.69207644215416">had</span>
    <span id="anchor56483b100.442560235244483">to</span>
    <span id="anchor56622b110.119111280943785">prepare</span>
    <span id="anchor56625b120.58963670841867">some</span>
    <span id="anchor56628b130.578634847224986">annotations</span>
    <span id="anchor56630b140.529899219297757">of</span>
    <span id="anchor56632b150.59504525670551">my</span>
    <span id="anchor56634b160.3619168411763">own,</span>
    <span id="anchor56637b170.304285453774168">and</span>
    <span id="anchor56639b180.888723325398156">in</span>
    <span id="anchor56642b190.476584654988993">order</span>
    <span id="anchor56644b200.169820267786188">to</span>
    <span id="anchor56646b210.609729114738167">do</span>
    <span id="anchor56624b220.525747115502948">that</span>
    <span id="anchor56653b230.618925380343071">I</span>
    <span id="anchor56655b240.596196227053272">compiled</span>
    <span id="anchor56658b250.233656210002329">the</span>
    <span id="anchor56660b260.829808299816124">text,</span>
    <span id="anchor56663b270.0700902040442872">published</span>
    <span id="anchor56665b280.0988374213217001">it,</span>
    <span id="anchor56860b290.923727810812987">made</span>
    <span id="anchor56862b300.169649500944488">my</span>
    <span id="anchor56864b310.481733354032847">annotation</span>
    <span id="anchor56866b320.225490911968747">and</span>
    <span id="anchor56868b330.826769410086223">then</span>
    <span id="anchor56870b340.290828662594235">pasted</span>
    <span id="anchor56872b350.35719305712599">the</span>
    <span id="anchor56875b360.878277696146759">ID</span>
    <span id="anchor56877b370.344250958107529">back</span>
    <span id="anchor56879b380.8149086655187">into</span>
    <span id="anchor56881b390.659146049832528">the</span>
    <span id="anchor56884b400.0363273997960274">source</span>
    <span id="anchor56886b410.257468900297521">XML</span>
    <span id="anchor56649b420.778257331241973">in</span>
    <span id="anchor56894b430.625964108214697">order</span>
    <span id="anchor56896b440.836103747522507">to</span>
    <span id="anchor56898b450.308156550074069">be</span>
    <span id="anchor56901b460.221009364454546">able</span>
    <span id="anchor56903b470.198020588233145">to</span>
    <span id="anchor56906b480.612442003848237">continue</span>
    <span id="anchor56908b490.109732689852702">writing.</span>
    <span id="anchor56910b500.6746052436878">Formbased</span>
    <span id="anchor56913b510.782262271634425">proof</span>
    <span id="anchor56915b520.719461804590869">reading</span>
    <span id="anchor56918b530.200352358725086">of</span>
    <span id="anchor56920b540.401187651511835">an</span>
    <span id="anchor56922b550.315658031178479">existing</span>
    <span id="anchor56925b560.434008568727415">digital</span>
    <span id="anchor56927b570.230995951327959">text</span>
    <span id="anchor56930b580.385748235222766">wouldn't</span>
    <span id="anchor56932b590.532845990049115">be</span>
    <span id="anchor56934b600.154723761675285">any</span>
    <span id="anchor56937b610.555397736167255">problem,</span>
    <span id="anchor56939b620.0145793436163009">though.</span></p>
        <h2 id="anchor54288a11">
    <span id="anchor56619b10.380214673644032">Javascript</span>
    <span id="anchor56464b20.382167146253477">&amp;</span>
    <span id="anchor56654b30.305408006210536">DOM</span>
    <span id="anchor56656b40.737407730770022">scripting</span></h2>
        <p id="anchor54292a12">
    <span id="anchor56462b10.260444841934575">You</span>
    <span id="anchor56653b20.649658964318064">can</span>
    <span id="anchor56655b30.55231639582306">find</span>
    <span id="anchor56657b40.919590892232764">the</span>
    <span id="anchor56622b50.685986364579753">possible</span>
    <span id="anchor56624b60.809785296120581">anchors</span>
    <span id="anchor56626b70.697848223009076">by</span>
    <span id="anchor56628b80.311950472328789">clicking</span>
    <span id="anchor56630b90.645889043643088">on</span>
    <span id="anchor56632b100.00600477261748387">the</span>
    <span id="anchor56635b110.532959837248996">link</span><strong id="anchor54295a2">
    <span id="anchor56653b10.843909631876233">Show</span>
    <span id="anchor56656b20.618446776465721">anchors</span></strong>
    <span id="anchor56632b10.642692527101698">,</span>
    <span id="anchor56634b20.518514875098371">and</span>
    <span id="anchor56653b30.400709047634485">hide</span>
    <span id="anchor56655b40.362154331226905">them</span>
    <span id="anchor56657b50.718867233823457">again</span>
    <span id="anchor56913b60.801896699611981">by</span>
    <span id="anchor56915b70.677812362405384">clicking</span>
    <span id="anchor56917b80.152875802085211">on</span><strong id="anchor54299a4">
    <span id="anchor56654b10.0328926504742786">Hide</span>
    <span id="anchor56656b20.0635605971624891">anchors</span></strong>
    <span id="anchor56912b10.685721792134327">at</span>
    <span id="anchor56653b20.187616412149564">the</span>
    <span id="anchor57332b30.618958333795405">same</span>
    <span id="anchor57334b40.700301136216289">place</span>
    <span id="anchor57336b50.567831085793595">(there</span>
    <span id="anchor57338b60.00112547958322125">is</span>
    <span id="anchor57341b70.00570914196116344">a</span>
    <span id="anchor57343b80.305238816563617">toggle).</span>
    <span id="anchor57345b90.261570321517796">There</span>
    <span id="anchor57347b100.655368106744889">are</span>
    <span id="anchor57349b110.857555212386677">two</span>
    <span id="anchor57353b120.181161213284899">javascript</span>
    <span id="anchor57355b130.341354470858981">functions</span>
    <span id="anchor57357b140.667340508507258">handling</span>
    <span id="anchor57359b150.879009436293975">the</span>
    <span id="anchor57361b160.65330494318777">toggling.</span>
    <span id="anchor57363b170.313229551684684">The</span>
    <span id="anchor57366b180.885014208911459">possibly</span>
    <span id="anchor57368b190.186264779971104">most</span>
    <span id="anchor57370b200.157139183095255">interesting,</span>
    <span id="anchor57372b210.503460984911519">but</span>
    <span id="anchor57351b220.828957307072802">also,</span>
    <span id="anchor57379b230.675654058659288">the</span>
    <span id="anchor57381b240.904170033011665">most</span>
    <span id="anchor57384b250.191111637834046">vulnerable,</span>
    <span id="anchor57386b260.394521292017084">feature</span>
    <span id="anchor57388b270.706066732157984">is</span>
    <span id="anchor57391b280.86892400023943">the</span>
    <span id="anchor57393b290.547397094567957">generation</span>
    <span id="anchor57396b300.738959382632263">of</span>
    <span id="anchor57398b310.93248459786758">javascript</span>
    <span id="anchor57400b320.233118886236622">by</span> <a id="anchor54305d60.926575794781826" href="http://sigfrid-lundberg.se/footnotes/make_javascript.xsl">XSLT
      from RSS</a>
    <span id="anchor57336b10.551442931197324">for</span>
    <span id="anchor57338b20.933420022452911">handling</span>
    <span id="anchor57340b30.49440688010976">the</span>
    <span id="anchor57342b40.552568410780546">readable</span>
    <span id="anchor57344b50.939129164879736">notes.</span>
    <span id="anchor57347b60.799645696673377">The</span>
    <span id="anchor57349b70.814138732298342">code</span>
    <span id="anchor57351b80.594497271158964">entering</span>
    <span id="anchor57354b90.657200909060054">the</span>
    <span id="anchor57356b100.995299946048902">notes</span>
    <span id="anchor57359b110.935851742017945">into</span>
    <span id="anchor57362b120.32454141710165">the</span>
    <span id="anchor57365b130.874309381877216">text</span>
    <span id="anchor57367b140.589156684740054">looks</span>
    <span id="anchor57370b150.637770968786334">like</span>
    <span id="anchor57372b160.759323590788675">this:</span></p>
        <pre id="anchor54313c130.77542146517682">
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
    <span id="anchor57371b10.79491015188159">The</span>
    <span id="anchor57338b20.262784575234533">rest</span>
    <span id="anchor57340b30.60437877178396">of</span>
    <span id="anchor57342b40.470564210075216">the</span>
    <span id="anchor57344b50.166954607780536">features</span>
    <span id="anchor57346b60.795490410083668">are</span>
    <span id="anchor57348b70.865085502557962">readily</span>
    <span id="anchor57350b80.87302133993852">visible</span>
    <span id="anchor57353b90.664414409857436">on</span>
    <span id="anchor57355b100.412482596660258">this</span>
    <span id="anchor57658b110.611980722105122">page.</span>
    <span id="anchor57662b120.596899007259355">You</span>
    <span id="anchor57664b130.64560148289688">have</span>
    <span id="anchor57666b140.538556516421287">to</span>
    <span id="anchor57668b150.148341937991018">reaload</span>
    <span id="anchor57671b160.579021505349791">the</span>
    <span id="anchor57673b170.032963396531047">page</span>
    <span id="anchor57676b180.700910348771564">to</span>
    <span id="anchor57678b190.518150669763866">see</span>
    <span id="anchor57680b200.832609093204424">the</span>
    <span id="anchor57683b210.515049081069906">new</span>
    <span id="anchor57661b220.112647940457169">footnote</span>
    <span id="anchor57689b230.489810001798817">--</span>
    <span id="anchor57692b240.510349026653147">if</span>
    <span id="anchor57694b250.0484996820094528">I</span>
    <span id="anchor57696b260.814351418900467">implement</span>
    <span id="anchor57699b270.384658408064702">this</span>
    <span id="anchor57701b280.637656366749507">I'll</span>
    <span id="anchor57704b290.45212238722114">will</span>
    <span id="anchor57706b300.143981998387716">refresh</span>
    <span id="anchor57708b310.413077831460665">those</span>
    <span id="anchor57711b320.24703253910273">asynchronously.</span></p>
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
