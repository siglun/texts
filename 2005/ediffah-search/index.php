<?php
require('./globals.php');	

initservice();

require('./fragments.php');
print ($sidhuvud_simple);
print utf8_encode('
	  <form action="./search.php" method="get">
          <input name="presentation" value="brief" type="hidden" />
          <input name="start" value="1" type="hidden" />
          <input name="number" value="10" type="hidden" />

	  <table class="navigation">

	    <tr  class="navigation">
	      <td colspan="2"   class="left">
		<input name="searchfield[2]" type="hidden" value="any" />
                  <strong>Fyll i s�kord (du kan h�gertrunkera med *) och klicka p� s�k</strong><br />
		  <input name="searchterm[2]" type="text" value="" size="45"/>
                  <input type="submit" value="S�k" /><br />
              </td>
	    </tr>');
if($_SERVER['PHP_AUTH_USER']) {
print utf8_encode('
            <tr  class="navigation">
            <td class="left" colspan="2">
                  <hr />
             <strong>V�lj databas</strong>
            </td></tr>

            <tr  class="navigation">
	      <td class="left">
	        <input name="db" type="radio"
		    value="ediffah" checked="checked" />
                    S�k i den publika databasen
              </td>
	      <td class="left">
		<input name="db" type="radio"
		    value="internal" />
                    S�k i den interna
              </td>
	    </tr>');
}

print utf8_encode('
            <tr  class="navigation">
            <td class="left" colspan="2">
             <hr />
             <strong>Du kan ocks� begr�nsa din s�kning till n�got
	          av biblioteken nedan</strong>
                  <input name="boolean[1]" type="hidden" value="and"/>
	          <input name="searchfield[1]" type="hidden" value="set" />
            </td></tr>
            <tr  class="navigation">

	      <td class="left">
		   <input name="searchterm[1]" type="radio"
		    value="gub" /> G�teborgs Universitetsbibliotek
              </td>
	      <td class="left">
		<input name="searchterm[1]" type="radio"
		    value="gubk" />G�teborgs Universitetsbibliotek, Kvinnohistoriska samlingarna
	      </td>
	    </tr>

	    <tr  class="navigation">
	      <td class="left">
		<input name="searchterm[1]" type="radio"
		    value="kb" />Kungl. Biblioteket Stockholm
              </td>
	      <td class="left">
		<input name="searchterm[1]" type="radio"
		    value="lub" />Lunds Universitets Bibliotek
	      </td>
	    </tr>


            <tr  class="navigation">
	      <td class="left">
		<input name="searchterm[1]" type="radio"
		    value="uub" />Uppsala Universitetsbibliotek
              </td>
	      <td class="left">
		<input name="searchterm[1]" type="radio"
		    value="" checked="checked" />Samtliga deltagande bibliotek
	      </td>
            </tr>

	  </table>
	  </form>

');

print ($sidfot_start);
?>
