.nr LL 16c
.nr HM 2.5c
.nr FM 2.5c
.nr PL 29.7c
.nr PO 2.5c
.nr PS 12
.ds marker \s+4\(bu\s-4
.R1
abbreviate "A"
reverse "A"
move-punctuation
accumulate
bracket-label " [" "]" ","
database ../biblo/bibliography_long
.R2
.EQ
delim $$
.EN
.TL
Proposal: An Enhanced Nordic Web index
.AU
Sigfrid Lundberg $nothing sup 1$, Anders Ardö $nothing sup 1,2$,Sebastian Hammer $nothing sup 3$
Kenneth Holmlund $nothing sup 4$ and Johan Mannerheim$nothing sup5$
.AI
\s-21) NetLab, Lund University Library Box 3, S-221 00 Lund, Sweden;
2) DTV/Development, Postboks 777, DK-2800 Lyngby, Denmark;
3) Index Data, Ryesgade 3, 2200 København N, Denmark;
4) Dept. Theoretical Physics, Umeå University, S-901 87 Umeå, Sweden
5) Kungl. biblioteket, Box 5039, S-102 41 Stockholm, Sweden
.SH
Background
.LP
The Nordic Web Index (NWI) project
is a collaborative
effort across the Nordic countries,
aiming at providing a free Worldwide Web
search service to the general public in the countries involved.
NWI has been fruitful for several reasons:
First and foremost we are today providing access to databases
covering the WWW in four of the Nordic countries,
and as of January 1997 three service points in
Denmark (http://nwi.dtv.dk/), Finland (http://nwi.funet.fi/) and
Sweden (http://nwi.ub2.lu.se/).
Second, we have been able to build a competence in the area,
and because of the \(lqpublic service\(rq nature of NWI and its
architecture building on open standards,
we are able to collaborate with other initiatives,
be it public sector or commercial ones.
NWI builds upon the idea of decentralization of harvesting, indexing as
well as of the service points.
This is an advantage because
it reduces network load,
it allows to have an up to date index of pages
and it allows individual participants to have lower investments.
.PP
The databases are assets of their own right,
and two of the NWI partners (Sweden and Finland) 
are now providing both access to their databases
and technical expertise to national web archiving efforts.
The project has also got reasonable good press response.
.PP
In spite of its apparent success,
the outcome of the NWI project did not meet our expectations.
The main reason for this is changes in the political economy of the WWW.
When the applications leading to the NWI and DESIRE
.[
Klaas Wierenga DESIRE General Information
.]
projects were filed to their respective funding agencies,
it was impossible to foresee the commercial impact of the WWW search engine,
and how fast the competition should evolve.
.PP
Today, a large number of robots roam the WWW,
feeding database records into general purpose robot based search engines,
and the proportion of all the requests recorded at some servers
emanating from them is approaching 10%.
The \(lqmarket\(rq we were addressing at the time is saturated.
Unfortunately,
the flourishing WWW search engine market 
has not lead to a corresponding enhanced quality of their service.
The main catalogue of any library (scientific and public libraries alike),
provide superior search facilities.
On the WWW, it is today impossible to look up \fIAugust Strindberg\fP
in any of the popular WWW search services,
\fIand\fP restrict the search to material \fIabout\fP him,
\fIor\fP to material authored \fIby\fP him, \fIor\fP to material \fIon\fP
works \fIby\fP him.
Any library catalogue is capable of making those distinctions.
However, the technology has developed,
and a number of interesting standards are evolving
that may relieve these and other shortcomings of the general
web search engine.
.PP
Much of the development we propose is triggered by this evolution.
Notably we wish to change the emphasis from being just another general purpose
search engine towards a modular indexing service which is able to fulfill
several different needs simultaneously,
such as archiving and metadata collection.
.PP
NetLab is involved in other efforts,
such as the Desire project and the Nordic Metadata Project,
.[
juha hakala
.]
which have goals that overlaps with efforts to refine the NWI service.
Obviously, some of the shortcomings will eliminated by the fact that
developments from the DESIRE
.[
Klaas Wierenga DESIRE General Information
.]
project will be incorporated in the NWI service.
However,
to implement some of them in the NWI,
further resources are needed.
.SH
The scope of an enhanced Nordic Web index
.LP
This proposal covers tree areas of possible improvement to the NWI system.
The first area covers actualization of the system and adaptation to 
future technologies.
This covers implementation of new protocols or new versions of protocols,
as well as preparations for interactions with other systems
(i.e. robots, archiving systems, indexing systems, etc).
The other two areas will cover improvements to the robot for keeping pace
with the growth of the WWW and the setting up of other NWI service points.
.LP
\f(BI1. Implementation of new standards and procedures.\fP
We would like to give NWI facilities that are at least approaching
what is achieved in a library OPAC.
Some of the solutions in this area are already financed within
Nordic Metadata project,
others can be obtained as feedback from the DESIRE project.
.IP
\*[marker] How can robot based indexing and summarizing be efficiently
combined with human value adding,
for instance in information gateways,
preprint archives and clearing houses where information is
added by librarians or editorial staff?
Where and how is such information stored and how is this made available
securely.
The robot will be made \(lqmetadata aware\(rq with
support from the Nordic Metadata project.
The DESIRE project will supply support for the building of multiple
databases using different kinds of metadata templates.
.IP
\fBFurther resources is needed for:\fP
(1) Modularization of the parser,
in the robot, making the record format independent of document parsing.
(2) Moving from GILS
.[
eliot christian geological survey gils
.]
v 1 to v 2.
(3)Investigation of the potentials of implementing the new  Z39.50
profile ZDSR
.[
ZDSR Profile Library of Congress
.]
in the robot and the search engine.
(4) Investigate whether query routing could be implemented in the
NWI search engine in the future.
(5) Take measures to consolidate the metadata handling in the
NWI system by the construction of a formal SGML
.[
sgml david seaman
.]
Document Type Definition for the NWI encoding of GILS records,
and an investigation of whether it would possible to use SGML software
tools to directly generate database records from arbitrary HTML/SGML
documents using a DSSSL
.[
Document Style Semantics and Specification Language James Clark
.]
style sheet.
.IP
\*[marker] NWI need more flexible harvesting policies.
For instance, large servers and organizations have approached us,
requesting tools and know\-how enabling them to index their own material.
Also, some partners are interested in harvesting,
but not really in indexing (WWW archiving initiatives).
Still, the harvesting has to be done in a coordinated and orderly fashion,
in order to avoid wasting network resources,
and harvesting done for the purpose of archiving should be accompanied
with indexing as well.
This poses problems for both the Harvesting robot and for the search system.
The DESIRE project has already developed a distributed harvesting system,
through which multiple robots are able run in a coordinated way.
.IP
\fBFurther resources needed for:\fP
(1) Development of tools for collaborative harvesting.
This implies that different sets of harvesters should be able to operate in
different parts of the Internet,
and still be able to share indexing information with each other.
(2) Investigation of the possibilities for combining query routing
and Z39.50 (see adding support for ZDSR above).
(3) Implementation of stringent scheduling,
in which certain servers are harvested at a high predetermined frequency
(for indexing and archiving of periodicals).
(4) Off line harvesting at large proxy servers.
(5) Enabling the robot to maintain a database of user identities and
passwords,
such that it will be able to index protected documents
after agreement with document providers.
.LP
\f(BI2. Adding value to the current service.\fP
The major new feature we would like to add to the current
service is the implementation of character equivalence classes,
though which it should be possible to search in the NWI databases making
the assumptions that ä is equivalent with æ, ö with ø etc.
In addition, we want to invest quite some time in refining
the search engine.
.IP
\fBFurther resources needed for:\fP
(1) Implementation of character equivalence classes.
(2) Making possible advanced searching using regular expressions
(3) Review of the search engine.
(4) Producing online help and URL registration.
.LP
\f(BI3. Maintenance and support.\fP
The current NWI services have some shortcomings,
due to shortage of resources for fine tuning of various components.
The documentation of the system also needs to be updated.
The database management in the harvester need to be improved.
.IP
\fBFurther resources needed for:\fP
(1) Release engineering for robot and gateway.
(2) Implementation of new database management schemes provided
by by the DESIRE project.
.ig
.IP
\*[marker] Consolidation of NWI's use of GILS records.

Hence NWI/EWI need more development work, some of which we cannot do
within Desire.
For instance 
.LP
How about trying to integrate NWI/EWI with the work done on
national WWW-caches (in DESIRE and TERENA) so to enable
NWI/EWI to take advantage of what there is in such a cache.
All in order to save network bandwidth and minimize the impact
on servers.
.LP
ivet vores problemer med super-sites som SunSite, bør man også lægge vægt
på metoder for kooperativ indexering. Her er det værd at huske, at NWI som
et internationalt projekt uden kommercielle interesser bør have gode
muligheder for at drive en evt. fælles standard for WWW indekser fremad.
.LP
7.) You name it...
.LP
Another half a manyear split between NetLab and Indexdata, with Anders as
the NWI responsible person at DTV would do it.
.LP
3. The third prerequisite that must be fulfilled is that Indexdata is
prepared to participate. Look upon it as getting some spare time for 
improving zebra, the gateway and working on ZSTARTS. Do you like the 
idea, and do you have the time?
.LP
- To what extent should query rerouting be used instead of a centralized
indexing system ? STARTS proposes some standards for how query results
from several servers should be merged but doesn't really (as far as I
know) address the details of the query rerouting problem, i.e.:
- A request is sent to two servers A and B. Server A returns
a query result, but server B just rerouts the query to server A,
and thus there is a risk of getting diplicate results.
- A query is sent to server A which rerouts the query to server
B, which rerouts to server A, etc - creating a loop.
- RDM defines a Taxonomy scheme that can be used to "guess" which
server might know "the answer" but there is no real support
for a query rerouting protocol (a'la CIP).
..
.na
.[
$LIST$
.]

