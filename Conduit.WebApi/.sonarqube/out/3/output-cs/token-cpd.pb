¿
dC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\AutoMapping\AutoMappingProfileConfiguration.cs
	namespace

 	
Conduit


 
.

 
Business

 
.

 
AutoMapping

 &
{ 
public 

class +
AutoMappingProfileConfiguration 0
:1 2
Profile3 :
{ 
public +
AutoMappingProfileConfiguration .
(. /
)/ 0
:1 2
this3 7
(7 8
$str8 C
)C D
{ 	
} 	
	protected +
AutoMappingProfileConfiguration 1
(1 2
string2 8
profileName9 D
)D E
:F G
baseH L
(L M
profileNameM X
)X Y
{ 	
	CreateMap 
< 
UserDto 
, 
User #
># $
($ %
)% &
.& '

ReverseMap' 1
(1 2
)2 3
;3 4
	CreateMap 
< 

CommentDto  
,  !
Comment" )
>) *
(* +
)+ ,
., -

ReverseMap- 7
(7 8
)8 9
;9 :
	CreateMap 
< 
ArticleViewModel &
,& '
Article( /
>/ 0
(0 1
)1 2
.2 3

ReverseMap3 =
(= >
)> ?
.? @
	ForMember@ I
(I J
destJ N
=>N P
destP T
.T U
TagsU Y
,Y Z
optZ ]
=>] _
opt_ b
.b c
MapFromc j
(j k
srck n
=>n p
srcp s
.s t
ArticleTagst 
.	 Ä
Select
Ä Ü
(
Ü á
p
á à
=>
à ä
p
ä ã
.
ã å
TagId
å ë
)
ë í
.
í ì
ToList
ì ô
(
ô ö
)
ö õ
)
õ ú
)
ú ù
;
ù û
	CreateMap 
< 
TagViewModel "
," #
Tag$ '
>' (
(( )
)) *
.* +

ReverseMap+ 5
(5 6
)6 7
.7 8
	ForMember8 A
(A B
destB F
=>G I
destJ N
.N O
TagO R
,R S
optT W
=>X Z
opt[ ^
.^ _
MapFrom_ f
(f g
srcg j
=>k m
srcn q
.q r
TagIdr w
)w x
)x y
;y z
} 	
} 
} ⁄
MC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Helpers\CryptoHelper.cs
	namespace 	
Conduit
 
. 
Business 
. 
Helpers "
{ 
public 

class 
CryptoHelper 
{		 
public 
static 
string 
Encrypt $
($ %
string% +
username, 4
,4 5
string6 <
password= E
)E F
{ 	
var 
provider 
= 
new 
SHA256Managed ,
(, -
)- .
;. /
var 
passwordByte 
= 
GetByte &
(& '
password' /
+0 1
username2 :
): ;
;; <
var 
passwordHash 
= 
provider '
.' (
ComputeHash( 3
(3 4
passwordByte4 @
)@ A
;A B
return 
BitConverter 
.  
ToString  (
(( )
passwordHash) 5
)5 6
;6 7
} 	
public 
static 
string 
Salt !
(! "
string" (
username) 1
)1 2
{ 	
var   
provider   
=   
new   
SHA256Managed   ,
(  , -
)  - .
;  . /
var!! 
usernameByte!! 
=!! 
GetByte!! &
(!!& '
username!!' /
)!!/ 0
;!!0 1
var"" 
salt"" 
="" 
provider"" 
.""  
ComputeHash""  +
(""+ ,
usernameByte"", 8
)""8 9
;""9 :
return## 
BitConverter## 
.##  
ToString##  (
(##( )
salt##) -
)##- .
;##. /
}$$ 	
public-- 
static-- 
bool-- 
IsPasswordMatch-- *
(--* +
string--+ 1
hash--2 6
,--6 7
string--8 >
password--? G
,--G H
string--H N
username--O W
)--W X
{.. 	
var// 
passwordHash// 
=// 
Encrypt// &
(//& '
username//' /
,/// 0
password//0 8
)//8 9
;//9 :
return00 
hash00 
.00 
Equals00 
(00 
passwordHash00 +
)00+ ,
;00, -
}11 	
public88 
static88 
byte88 
[88 
]88 
GetByte88 $
(88$ %
string88% +
value88, 1
)881 2
{99 	
return:: 
Encoding:: 
.:: 
UTF8::  
.::  !
GetBytes::! )
(::) *
value::* /
)::/ 0
;::0 1
};; 	
}<< 
}== À2
jC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\EntityFramework\EfArticleFavoriteManager.cs
	namespace

 	
Conduit


 
.

 
Business

 
.

 
Managers

 #
.

# $
EntityFramework

$ 3
{ 
public 

class $
EfArticleFavoriteManager )
:* +
ManagerBase, 7
<7 8
ArticleFavorite8 G
>G H
,H I$
IArticleFavoriteServicesJ b
{ 
private 
readonly 
IRepository $
<$ %
ArticleFavorite% 4
>4 5
_repository6 A
;A B
private 
IArticleServices  
_articleServices! 1
{2 3
get4 7
;7 8
}9 :
private 
IUserServices 
_userServices +
{, -
get. 1
;1 2
}3 4
public $
EfArticleFavoriteManager '
(' (
IRepository( 3
<3 4
ArticleFavorite4 C
>C D

repositoryE O
,O P
IArticleServicesQ a
articleServicesb q
,q r
IUserServices	s Ä
userServices
Å ç
)
ç é
:
è ê
base
ë ï
(
ï ñ

repository
ñ †
)
† °
{ 	
_repository 
= 

repository $
;$ %
_articleServices 
= 
articleServices .
;. /
_userServices 
= 
userServices (
;( )
} 	
public 
async 
Task 
< 
ResultMessage '
<' (
ArticleFavorite( 7
>7 8
>8 9
AddFavoriteArticle: L
(L M
intM P
userIdQ W
,W X
intY \
	articleId] f
)f g
{ 	
ResultMessage 
< 
ArticleFavorite )
>) *
resultMessage+ 8
=9 :
new; >
ResultMessage? L
<L M
ArticleFavoriteM \
>\ ]
(] ^
)^ _
;_ `
var 
isArticleExist 
=  
_articleServices! 1
.1 2
Get2 5
(5 6
p6 7
=>8 :
p; <
.< =
Id= ?
==@ B
	articleIdC L
)L M
;M N
if 
( 
isArticleExist 
== !
null" &
)& '
{ 
resultMessage 
. 
Errors $
=% &
new' *
ErrorMessageObj+ :
(: ;
ErrorMessageCode; K
.K L
ArticleNotFoundL [
,[ \
$str] x
)x y
;y z
return   
resultMessage   $
;  $ %
}!! 
var"" 
user"" 
="" 
_userServices"" $
.""$ %
Get""% (
(""( )
p"") *
=>""+ -
p"". /
.""/ 0
Id""0 2
==""3 5
userId""6 <
)""< =
;""= >
if## 
(## 
_userServices## 
==##  
null##! %
)##% &
{$$ 
resultMessage%% 
.%% 
Errors%% $
=%%% &
new%%' *
ErrorMessageObj%%+ :
(%%: ;
ErrorMessageCode%%; K
.%%K L
UserNotFound%%L X
,%%X Y
$str%%Z x
)%%x y
;%%y z
return&& 
resultMessage&& $
;&&$ %
}'' 
var(( 
articleFavorite(( 
=((  !
Get((" %
(((% &
p((& '
=>((( *
p((+ ,
.((, -
UserId((- 3
==((4 6
userId((7 =
&&((> @
p((A B
.((B C
	ArticleId((C L
==((M O
	articleId((P Y
)((Y Z
;((Z [
if)) 
()) 
articleFavorite)) 
!=))  "
null))# '
)))' (
{** 
resultMessage++ 
.++ 
Errors++ $
=++% &
new++' *
ErrorMessageObj+++ :
(++: ;
ErrorMessageCode++; K
.++K L(
ArticleFavoriteAlreadyExists++L h
,++h i
$str	++j î
)
++î ï
;
++ï ñ
return,, 
resultMessage,, $
;,,$ %
}-- 
try// 
{00 
var11 
durum11 
=11 
await11 !
Insert11" (
(11( )
new11) ,
ArticleFavorite11- <
(11< =
)11= >
{11? @
	ArticleId11A J
=11K L
	articleId11M V
,11V W
UserId11X ^
=11_ `
userId11a g
}11h i
)11i j
;11j k
if22 
(22 
durum22 
<22 
$num22 
)22 
{33 
resultMessage44 !
.44! "
Errors44" (
=44) *
new44+ .
ErrorMessageObj44/ >
(44> ?
ErrorMessageCode44? O
.44O P+
ArticleFavoriteCouldNotInserted44P o
,44o p
$str	44q ó
)
44ó ò
;
44ò ô
return55 
resultMessage55 (
;55( )
}66 
resultMessage88 
.88 
Result88 $
=88% &
new88' *
ArticleFavorite88+ :
(88: ;
)88; <
{88= >
	ArticleId88? H
=88I J
	articleId88K T
,88T U
UserId88V \
=88] ^
userId88_ e
}88f g
;88g h
return:: 
resultMessage:: $
;::$ %
};; 
catch<< 
(<< 
	Exception<< 
ex<< 
)<<  
{== 
resultMessage?? 
.?? 
Errors?? $
=??% &
new??' *
ErrorMessageObj??+ :
(??: ;
ErrorMessageCode??; K
.??K L
CriticalError??L Y
,??Y Z
ex??[ ]
.??] ^
Message??^ e
)??e f
;??f g
return@@ 
resultMessage@@ $
;@@$ %
}AA 
}CC 	
}EE 
}FF Çf
bC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\EntityFramework\EfArticleManager.cs
	namespace 	
Conduit
 
. 
Business 
. 
Managers #
.# $
EntityFramework$ 3
{ 
public 

class 
EfArticleManager !
:" #
ManagerBase$ /
</ 0
Article0 7
>7 8
,8 9
IArticleServices: J
{ 
private 
readonly 
IRepository $
<$ %
Article% ,
>, -
_repository. 9
;9 :
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
ITagServices %
_tagServices& 2
;2 3
public 
EfArticleManager 
(  
IRepository  +
<+ ,
Article, 3
>3 4

repository5 ?
,? @
ITagServicesA M
tagServicesN Y
,Y Z
IMapper[ b
mapperc i
)i j
:k l
basem q
(q r

repositoryr |
)| }
{ 	
_repository 
= 

repository $
;$ %
_tagServices 
= 
tagServices &
;& '
_mapper 
= 
mapper 
; 
} 	
public 
async 
Task 
< 
ResultMessage '
<' (
Article( /
>/ 0
>0 1
Delete2 8
(8 9
int9 <
id= ?
)? @
{ 	
ResultMessage 
< 
Article !
>! "
resultMessage# 0
=1 2
new3 6
ResultMessage7 D
<D E
ArticleE L
>L M
(M N
)N O
;O P
var 
article 
= 
await 
Get  #
(# $
p$ %
=>& (
p) *
.* +
Id+ -
==. 0
id1 3
)3 4
;4 5
if   
(   
article   
!=   
null   
)    
{!! 
var"" 
sonuc"" 
="" 
await"" !
base""" &
.""& '
Delete""' -
(""- .
article"". 5
)""5 6
;""6 7
if## 
(## 
sonuc## 
>## 
$num## 
)## 
{$$ 
resultMessage%% !
.%%! "
Result%%" (
=%%) *
null%%+ /
;%%/ 0
}&& 
else'' 
{(( 
resultMessage)) !
.))! "
Errors))" (
=))) *
new))+ .
ErrorMessageObj))/ >
())> ?
ErrorMessageCode))? O
.))O P"
ArticleCouldNotDeleted))P f
,))f g
$str))h |
)))| }
;))} ~
}** 
}++ 
else,, 
{-- 
resultMessage.. 
... 
Errors.. $
=..% &
new..' *
ErrorMessageObj..+ :
(..: ;
ErrorMessageCode..; K
...K L
ArticleNotFound..L [
,..[ \
$str..] x
)..x y
;..y z
}// 
return00 
resultMessage00  
;00  !
}11 	
public33 
async33 
Task33 
<33 
ArticleListModel33 *
>33* +
GetListModel33, 8
(338 9
ArticleQuery339 E
query33F K
)33K L
{44 	
ArticleListModel55 
	listModel55 &
=55' (
new55) ,
ArticleListModel55- =
(55= >
)55> ?
;55? @

IQueryable66 
<66 
Article66 
>66 
	queryable66  )
=66* +
GetIncludes66, 7
(667 8
p668 9
=>66: <
p66= >
.66> ?

AuthorUser66? I
,66I J
x66K L
=>66M O
x66P Q
.66Q R
ArticleTags66R ]
)66] ^
;66^ _
if88 
(88 
!88 
string88 
.88 
IsNullOrWhiteSpace88 *
(88* +
query88+ 0
.880 1
TagId881 6
)886 7
)887 8
{99 
var:: 
isTag:: 
=:: 
await:: !
_tagServices::" .
.::. /
Get::/ 2
(::2 3
p::3 4
=>::5 7
p::8 9
.::9 :
TagId::: ?
==::@ B
query::C H
.::H I
TagId::I N
)::N O
;::O P
if;; 
(;; 
isTag;; 
!=;; 
null;; !
);;! "
{<< 
	queryable== 
=== 
	queryable==  )
.==) *
Where==* /
(==/ 0
p==0 1
=>==2 4
p==5 6
.==6 7
ArticleTags==7 B
.==B C
Select==C I
(==I J
x==J K
=>==L N
x==O P
.==P Q
TagId==Q V
)==V W
.==W X
Contains==X `
(==` a
isTag==a f
.==f g
TagId==g l
)==l m
)==m n
;==n o
}>> 
}?? 
varAA 
articleListAA 
=AA 
	queryableAA '
.AA' (
OrderByDescendingAA( 9
(AA9 :
pAA: ;
=>AA< >
pAA? @
.AA@ A
	UpdatedAtAAA J
)AAJ K
.AAK L
SkipAAL P
(AAP Q
queryAAQ V
.AAV W
OffsetAAW ]
*AA^ _
queryAA` e
.AAe f
LimitAAf k
)AAk l
.AAl m
TakeAAm q
(AAq r
queryAAr w
.AAw x
LimitAAx }
)AA} ~
.AA~ 
ToList	AA Ö
(
AAÖ Ü
)
AAÜ á
;
AAá à
awaitDD 
TaskDD 
.DD 
RunDD 
(DD 
(DD 
)DD 
=>DD  
	listModelDD! *
.DD* +
ArticlesDD+ 3
=DD4 5
_mapperDD6 =
.DD= >
MapDD> A
<DDA B
ListDDB F
<DDF G
ArticleDDG N
>DDN O
,DDO P
ListDDQ U
<DDU V
ArticleViewModelDDV f
>DDf g
>DDg h
(DDh i
articleListDDi t
)DDt u
)DDu v
;DDv w
	listModelII 
.II 

TotalCountII  
=II! "
	queryableII# ,
.II, -
CountII- 2
(II2 3
)II3 4
;II4 5
returnJJ 
	listModelJJ 
;JJ 
}KK 	
publicMM 
newMM 
asyncMM 
TaskMM 
<MM 
ResultMessageMM +
<MM+ ,
ArticleMM, 3
>MM3 4
>MM4 5
InsertMM6 <
(MM< =
ArticleMM= D
articleMME L
)MML M
{NN 	
ResultMessagePP 
<PP 
ArticlePP !
>PP! "
resultMessagePP# 0
=PP1 2
newPP3 6
ResultMessagePP7 D
<PPD E
ArticlePPE L
>PPL M
(PPM N
)PPN O
;PPO P
varQQ 
durumQQ 
=QQ 
awaitQQ 
GetQQ !
(QQ! "
pQQ" #
=>QQ$ &
pQQ' (
.QQ( )
SlugQQ) -
==QQ. 0
articleQQ1 8
.QQ8 9
SlugQQ9 =
)QQ= >
;QQ> ?
ifRR 
(RR 
durumRR 
==RR 
nullRR 
)RR 
{SS 
articleTT 
.TT 
	CreatedAtTT !
=TT" #
DateTimeTT$ ,
.TT, -
NowTT- 0
;TT0 1
articleUU 
.UU 
	UpdatedAtUU !
=UU" #
DateTimeUU$ ,
.UU, -
NowUU- 0
;UU0 1
varVV 
sonucVV 
=VV 
awaitVV !
baseVV" &
.VV& '
InsertVV' -
(VV- .
articleVV. 5
)VV5 6
;VV6 7
ifWW 
(WW 
sonucWW 
>WW 
$numWW 
)WW 
{XX 
resultMessageYY !
.YY! "
ResultYY" (
=YY) *
articleYY+ 2
;YY2 3
}ZZ 
else[[ 
{\\ 
resultMessage]] !
.]]! "
Errors]]" (
=]]) *
new]]+ .
ErrorMessageObj]]/ >
(]]> ?
ErrorMessageCode]]? O
.]]O P#
ArticleCouldNotInserted]]P g
,]]g h
$str]]i }
)]]} ~
;]]~ 
}^^ 
}__ 
else`` 
{aa 
resultMessagebb 
.bb 
Errorsbb $
=bb% &
newbb' *
ErrorMessageObjbb+ :
(bb: ;
ErrorMessageCodebb; K
.bbK L$
ArticleSlugAlreadyExistsbbL d
,bbd e
$str	bbf Æ
)
bbÆ Ø
;
bbØ ∞
}cc 
returndd 
resultMessagedd  
;dd  !
}ee 	
publicgg 
newgg 
asyncgg 
Taskgg 
<gg 
ResultMessagegg +
<gg+ ,
Articlegg, 3
>gg3 4
>gg4 5
Updategg6 <
(gg< =
Articlegg= D
articleggE L
)ggL M
{hh 	
ResultMessageii 
<ii 
Articleii !
>ii! "
resultMessageii# 0
=ii1 2
newii3 6
ResultMessageii7 D
<iiD E
ArticleiiE L
>iiL M
(iiM N
)iiN O
;iiO P
ifjj 
(jj 
Getjj 
(jj 
pjj 
=>jj 
pjj 
.jj 
Slugjj 
==jj  "
articlejj# *
.jj* +
Slugjj+ /
)jj/ 0
!=jj1 3
nulljj4 8
)jj8 9
{kk 
resultMessagell 
.ll 
Errorsll $
=ll% &
newll' *
ErrorMessageObjll+ :
(ll: ;
ErrorMessageCodell; K
.llK L$
ArticleSlugAlreadyExistsllL d
,lld e
$str	llf Æ
)
llÆ Ø
;
llØ ∞
returnmm 
resultMessagemm $
;mm$ %
}nn 
varpp 
objpp 
=pp 
awaitpp 
Getpp 
(pp  
ppp  !
=>pp" $
ppp% &
.pp& '
Idpp' )
==pp* ,
articlepp- 4
.pp4 5
Idpp5 7
)pp7 8
;pp8 9
ifqq 
(qq 
objqq 
!=qq 
nullqq 
)qq 
{rr 
objss 
.ss 
	UpdatedAtss 
=ss 
DateTimess  (
.ss( )
Nowss) ,
;ss, -
objtt 
.tt 
Bodytt 
=tt 
articlett "
.tt" #
Bodytt# '
;tt' (
objuu 
.uu 
AuthorUserIduu  
=uu! "
articleuu# *
.uu* +
AuthorUserIduu+ 7
;uu7 8
objvv 
.vv 
Descriptionvv 
=vv  !
articlevv" )
.vv) *
Descriptionvv* 5
;vv5 6
objww 
.ww 
Titleww 
=ww 
articleww #
.ww# $
Titleww$ )
;ww) *
objxx 
.xx 
Slugxx 
=xx 
articlexx "
.xx" #
Slugxx# '
;xx' (
varyy 
sonucyy 
=yy 
awaityy !
baseyy" &
.yy& '
Updateyy' -
(yy- .
objyy. 1
)yy1 2
;yy2 3
ifzz 
(zz 
sonuczz 
>zz 
$numzz 
)zz 
{{{ 
resultMessage|| !
.||! "
Result||" (
=||) *
obj||+ .
;||. /
}}} 
else~~ 
{ 
resultMessage
ÄÄ !
.
ÄÄ! "
Errors
ÄÄ" (
=
ÄÄ) *
new
ÄÄ+ .
ErrorMessageObj
ÄÄ/ >
(
ÄÄ> ?
ErrorMessageCode
ÄÄ? O
.
ÄÄO P$
ArticleCouldNotUpdated
ÄÄP f
,
ÄÄf g
$strÄÄh Ä
)ÄÄÄ Å
;ÄÄÅ Ç
}
ÅÅ 
}
ÇÇ 
else
ÉÉ 
{
ÑÑ 
resultMessage
ÖÖ 
.
ÖÖ 
Errors
ÖÖ $
=
ÖÖ% &
new
ÖÖ' *
ErrorMessageObj
ÖÖ+ :
(
ÖÖ: ;
ErrorMessageCode
ÖÖ; K
.
ÖÖK L
ArticleNotFound
ÖÖL [
,
ÖÖ[ \
$str
ÖÖ] x
)
ÖÖx y
;
ÖÖy z
}
ÜÜ 
return
áá 
resultMessage
áá  
;
áá  !
}
àà 	
}
ââ 
}ää £+
eC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\EntityFramework\EfArticleTagManager.cs
	namespace

 	
Conduit


 
.

 
Business

 
.

 
Managers

 #
.

# $
EntityFramework

$ 3
{ 
public 

class 
EfArticleTagManager $
:% &
ManagerBase' 2
<2 3

ArticleTag3 =
>= >
,> ? 
IArticleTagsServices@ T
{ 
private 
readonly 
IRepository $
<$ %

ArticleTag% /
>/ 0
_repository1 <
;< =
private 
IArticleServices  
_articleServices! 1
{2 3
get4 7
;7 8
}9 :
private 
ITagServices 
_tagServices )
{* +
get, /
;/ 0
}1 2
public 
EfArticleTagManager "
(" #
IRepository# .
<. /

ArticleTag/ 9
>9 :

repository; E
,E F
ITagServicesG S
tagServicesT _
,_ `
IArticleServicesa q
articleServices	r Å
)
Å Ç
:
É Ñ
base
Ö â
(
â ä

repository
ä î
)
î ï
{ 	
_repository 
= 

repository $
;$ %
_articleServices 
= 
articleServices .
;. /
_tagServices 
= 
tagServices &
;& '
} 	
public 
new 
async 
Task 
< 
ResultMessage +
<+ ,

ArticleTag, 6
>6 7
>7 8
Insert9 ?
(? @

ArticleTag@ J

articleTagK U
)U V
{ 	
ResultMessage 
< 

ArticleTag $
>$ %
resultMessage& 3
=4 5
new6 9
ResultMessage: G
<G H

ArticleTagH R
>R S
(S T
)T U
;U V
var 
isExists 
= 
await  
Get! $
($ %
p% &
=>' )
p* +
.+ ,
TagId, 1
==2 4

articleTag5 ?
.? @
TagId@ E
&&F H
pI J
.J K
	ArticleIdK T
==U W

articleTagX b
.b c
	ArticleIdc l
)l m
;m n
if 
( 
isExists 
== 
null  
)  !
{ 
var 
tag 
= 
_tagServices &
.& '
Get' *
(* +
p+ ,
=>- /
p0 1
.1 2
TagId2 7
==8 :

articleTag; E
.E F
TagIdF K
)K L
;L M
if 
( 
tag 
!= 
null 
)  
{   
var!! 
article!! 
=!!  !
await!!" '
_articleServices!!( 8
.!!8 9
Get!!9 <
(!!< =
p!!= >
=>!!? A
p!!B C
.!!C D
Id!!D F
==!!G I

articleTag!!J T
.!!T U
	ArticleId!!U ^
)!!^ _
;!!_ `
if"" 
("" 
article"" 
!=""  "
null""# '
)""' (
{## 
var$$ 
sonuc$$ !
=$$" #
await$$# (
base$$) -
.$$- .
Insert$$. 4
($$4 5

articleTag$$5 ?
)$$? @
;$$@ A
if%% 
(%% 
sonuc%% !
>%%" #
$num%%$ %
)%%% &
{&& 
resultMessage'' )
.'') *
Result''* 0
=''1 2

articleTag''3 =
;''= >
}(( 
else)) 
{** 
resultMessage++ )
.++) *
Errors++* 0
=++1 2
new++3 6
ErrorMessageObj++7 F
(++F G
ErrorMessageCode++G W
.++W X&
ArticleTagCouldNotInserted++X r
,++r s
$str	++t ó
)
++ó ò
;
++ò ô
},, 
}-- 
else.. 
{// 
resultMessage00 %
.00% &
Errors00& ,
=00- .
new00/ 2
ErrorMessageObj003 B
(00B C
ErrorMessageCode00C S
.00S T
ArticleNotFound00T c
,00c d
$str00e y
)00y z
;00z {
}11 
}22 
else33 
{44 
resultMessage55 !
.55! "
Errors55" (
=55) *
new55+ .
ErrorMessageObj55/ >
(55> ?
ErrorMessageCode55? O
.55O P
TagNotFound55P [
,55[ \
$str55] w
)55w x
;55x y
}66 
}77 
else88 
{99 
resultMessage:: 
.:: 
Errors:: $
=::% &
new::' *
ErrorMessageObj::+ :
(::: ;
ErrorMessageCode::; K
.::K L#
ArticleTagAlreadyExists::L c
,::c d
$str	::e í
)
::í ì
;
::ì î
};; 
return<< 
resultMessage<<  
;<<  !
}== 	
}>> 
}?? Ñc
bC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\EntityFramework\EfCommentManager.cs
	namespace 	
Conduit
 
. 
Business 
. 
Managers #
.# $
EntityFramework$ 3
{ 
public 

class 
EfCommentManager !
:" #
ManagerBase$ /
</ 0
Comment0 7
>7 8
,8 9
ICommentSercices: J
{ 
private 
readonly 
IRepository $
<$ %
Comment% ,
>, -
_repository. 9
;9 :
private 
readonly 
IMapper  
_mapper! (
;( )
private 
readonly 
IArticleServices )
_articleServices* :
;: ;
private 
readonly 
IUserServices &
_userServices' 4
;4 5
public 
EfCommentManager 
(  
IRepository  +
<+ ,
Comment, 3
>3 4

repository5 ?
,? @
IMapperA H
mapperI O
,O P
IArticleServicesQ a
articleServicesb q
,q r
IUserServices	s Ä
userServices
Å ç
)
ç é
:
è ê
base
ë ï
(
ï ñ

repository
ñ †
)
† °
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
_articleServices 
= 
articleServices .
;. /
_userServices 
= 
userServices (
;( )
} 	
public 
async 
Task 
< 
ResultMessage '
<' (

CommentDto( 2
>2 3
>3 4
DeleteAsync5 @
(@ A
intA D
idE G
)G H
{ 	
ResultMessage 
< 

CommentDto $
>$ %
resultMessage& 3
=4 5
new6 9
ResultMessage: G
<G H

CommentDtoH R
>R S
(S T
)T U
;U V
var 
comment 
= 
await 
Get  #
(# $
p$ %
=>& (
p) *
.* +
Id+ -
==. 0
id1 3
)3 4
;4 5
if   
(   
comment   
!=   
null   
)    
{!! 
var"" 
sonuc"" 
="" 
await""  
base""! %
.""% &
Delete""& ,
("", -
comment""- 4
)""4 5
;""5 6
if## 
(## 
sonuc## 
>## 
$num## 
)## 
{$$ 
resultMessage%% !
.%%! "
Result%%" (
=%%) *
null%%+ /
;%%/ 0
}&& 
else'' 
{(( 
resultMessage)) !
.))! "
Errors))" (
=))) *
new))+ .
ErrorMessageObj))/ >
())> ?
ErrorMessageCode))? O
.))O P"
CommentCouldNotDeleted))P f
,))f g
$str))h {
))){ |
;))| }
}** 
}++ 
else,, 
{-- 
resultMessage.. 
... 
Errors.. $
=..% &
new..' *
ErrorMessageObj..+ :
(..: ;
ErrorMessageCode..; K
...K L
CommentNotFound..L [
,..[ \
$str..] p
)..p q
;..q r
}// 
return00 
resultMessage00  
;00  !
}11 	
public33 
async33 
Task33 
<33 
ResultMessage33 '
<33' (

CommentDto33( 2
>332 3
>333 4
InsertAsync335 @
(33@ A

CommentDto33A K

commentDto33L V
)33V W
{44 	
ResultMessage55 
<55 

CommentDto55 $
>55$ %
resultMessage55& 3
=554 5
new556 9
ResultMessage55: G
<55G H

CommentDto55H R
>55R S
(55S T
)55T U
;55U V
var66 
user66 
=66 
_userServices66 $
.66$ %
Get66% (
(66( )
p66) *
=>66+ -
p66. /
.66/ 0
Id660 2
==663 5

commentDto666 @
.66@ A
AuthorUserId66A M
)66M N
;66N O
if77 
(77 
user77 
!=77 
null77 
)77 
{88 
var99 
article99 
=99 
await99 #
_articleServices99$ 4
.994 5
Get995 8
(998 9
p999 :
=>99; =
p99> ?
.99? @
Id99@ B
==99C E

commentDto99F P
.99P Q
	ArticleId99Q Z
)99Z [
;99[ \
if:: 
(:: 
article:: 
!=:: 
null:: #
)::# $
{;; 

commentDto<< 
.<< 
	CreatedAt<< (
=<<) *
DateTime<<+ 3
.<<3 4
Now<<4 7
;<<7 8

commentDto== 
.== 
	UpdatedAt== (
===) *
DateTime==+ 3
.==3 4
Now==4 7
;==7 8
Comment>> 
comment>> #
=>>$ %
_mapper>>& -
.>>- .
Map>>. 1
<>>1 2
Comment>>2 9
>>>9 :
(>>: ;

commentDto>>; E
)>>E F
;>>F G
int?? 
sonuc?? 
=?? 
await?? $
base??% )
.??) *
Insert??* 0
(??0 1
comment??1 8
)??8 9
;??9 :
if@@ 
(@@ 
sonuc@@ 
>@@ 
$num@@  !
)@@! "
{AA 
resultMessageBB %
.BB% &
ResultBB& ,
=BB- .
_mapperBB/ 6
.BB6 7
MapBB7 :
<BB: ;

CommentDtoBB; E
>BBE F
(BBF G
commentBBG N
)BBN O
;BBO P
}CC 
elseDD 
{EE 
resultMessageFF %
.FF% &
ErrorsFF& ,
=FF- .
newFF/ 2
ErrorMessageObjFF3 B
(FFB C
ErrorMessageCodeFFC S
.FFS T#
CommentCouldNotInsertedFFT k
,FFk l
$str	FFm Ä
)
FFÄ Å
;
FFÅ Ç
}GG 
}HH 
elseII 
{JJ 
resultMessageKK !
.KK! "
ErrorsKK" (
=KK) *
newKK+ .
ErrorMessageObjKK/ >
(KK> ?
ErrorMessageCodeKK? O
.KKO P
ArticleNotFoundKKP _
,KK_ `
$strKKa u
)KKu v
;KKv w
}LL 
}MM 
elseNN 
{OO 
resultMessagePP 
.PP 
ErrorsPP $
=PP% &
newPP' *
ErrorMessageObjPP+ :
(PP: ;
ErrorMessageCodePP; K
.PPK L
UserNotFoundPPL X
,PPX Y
$strPPZ q
)PPq r
;PPr s
}QQ 
returnSS 
resultMessageSS  
;SS  !
}TT 	
publicVV 
asyncVV 
TaskVV 
<VV 
ResultMessageVV '
<VV' (

CommentDtoVV( 2
>VV2 3
>VV3 4
UpdateAsyncVV5 @
(VV@ A

CommentDtoVVA K

commentDtoVVL V
)VVV W
{WW 	
ResultMessageXX 
<XX 

CommentDtoXX $
>XX$ %
resultMessageXX& 3
=XX4 5
newXX6 9
ResultMessageXX: G
<XXG H

CommentDtoXXH R
>XXR S
(XXS T
)XXT U
;XXU V
varYY 
userYY 
=YY 
_userServicesYY $
.YY$ %
GetYY% (
(YY( )
pYY) *
=>YY+ -
pYY. /
.YY/ 0
IdYY0 2
==YY3 5

commentDtoYY6 @
.YY@ A
AuthorUserIdYYA M
)YYM N
;YYN O
ifZZ 
(ZZ 
userZZ 
!=ZZ 
nullZZ 
)ZZ 
{[[ 
var\\ 
article\\ 
=\\ 
_articleServices\\ .
.\\. /
Get\\/ 2
(\\2 3
p\\3 4
=>\\5 7
p\\8 9
.\\9 :
Id\\: <
==\\= ?

commentDto\\@ J
.\\J K
	ArticleId\\K T
)\\T U
;\\U V
if]] 
(]] 
article]] 
!=]] 
null]] #
)]]# $
{^^ 
Comment__ 
comment__ #
=__$ %
await__% *
Get__+ .
(__. /
p__/ 0
=>__1 3
p__4 5
.__5 6
Id__6 8
==__9 ;

commentDto__< F
.__F G
Id__G I
)__I J
;__J K
if`` 
(`` 
comment`` 
==``  "
null``# '
)``' (
{aa 
resultMessagebb %
.bb% &
Errorsbb& ,
=bb- .
newbb/ 2
ErrorMessageObjbb3 B
(bbB C
ErrorMessageCodebbC S
.bbS T
CommentNotFoundbbT c
,bbc d
$strbbe x
)bbx y
;bby z
}cc 
elsedd 
{ee 
commentgg 
.gg  
	UpdatedAtgg  )
=gg* +
DateTimegg, 4
.gg4 5
Nowgg5 8
;gg8 9
commenthh 
.hh  
AuthorUserIdhh  ,
=hh- .

commentDtohh/ 9
.hh9 :
AuthorUserIdhh: F
;hhF G
commentii 
.ii  
	ArticleIdii  )
=ii* +

commentDtoii, 6
.ii6 7
	ArticleIdii7 @
;ii@ A
commentjj 
.jj  
Bodyjj  $
=jj% &

commentDtojj' 1
.jj1 2
Bodyjj2 6
;jj6 7
intkk 
sonuckk !
=kk" #
awaitkk$ )
basekk* .
.kk. /
Updatekk/ 5
(kk5 6
commentkk6 =
)kk= >
;kk> ?
ifll 
(ll 
sonucll !
>ll" #
$numll$ %
)ll% &
{mm 
resultMessagenn )
.nn) *
Resultnn* 0
=nn1 2
_mappernn3 :
.nn: ;
Mapnn; >
<nn> ?

CommentDtonn? I
>nnI J
(nnJ K
commentnnK R
)nnR S
;nnS T
}oo 
elsepp 
{qq 
resultMessagerr )
.rr) *
Errorsrr* 0
=rr1 2
newrr3 6
ErrorMessageObjrr7 F
(rrF G
ErrorMessageCoderrG W
.rrW X"
CommentCouldNotUpdatedrrX n
,rrn o
$str	rrp á
)
rrá à
;
rrà â
}ss 
}tt 
}uu 
elsevv 
{ww 
resultMessagexx !
.xx! "
Errorsxx" (
=xx) *
newxx+ .
ErrorMessageObjxx/ >
(xx> ?
ErrorMessageCodexx? O
.xxO P
ArticleNotFoundxxP _
,xx_ `
$strxxa u
)xxu v
;xxv w
}yy 
}zz 
else{{ 
{|| 
resultMessage}} 
.}} 
Errors}} $
=}}% &
new}}' *
ErrorMessageObj}}+ :
(}}: ;
ErrorMessageCode}}; K
.}}K L
UserNotFound}}L X
,}}X Y
$str}}Z q
)}}q r
;}}r s
}~~ 
return
ÄÄ 
resultMessage
ÄÄ  
;
ÄÄ  !
}
ÅÅ 	
public
ÉÉ 
new
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
List
ÉÉ "
<
ÉÉ" #

CommentDto
ÉÉ# -
>
ÉÉ- .
>
ÉÉ. /
GetListAsync
ÉÉ0 <
(
ÉÉ< =
)
ÉÉ= >
{
ÑÑ 	
var
ÖÖ 
commentList
ÖÖ 
=
ÖÖ 
await
ÖÖ "
base
ÖÖ# '
.
ÖÖ' (
GetList
ÖÖ( /
(
ÖÖ/ 0
)
ÖÖ0 1
;
ÖÖ1 2
return
ÜÜ 
_mapper
ÜÜ 
.
ÜÜ 
Map
ÜÜ 
<
ÜÜ 
List
ÜÜ #
<
ÜÜ# $

CommentDto
ÜÜ$ .
>
ÜÜ. /
>
ÜÜ/ 0
(
ÜÜ0 1
commentList
ÜÜ1 <
)
ÜÜ< =
;
ÜÜ= >
}
áá 	
}
àà 
}ââ Ï(
gC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\EntityFramework\EfFollowedUserManager.cs
	namespace

 	
Conduit


 
.

 
Business

 
.

 
Managers

 #
.

# $
EntityFramework

$ 3
{ 
public 

class !
EfFollowedUserManager &
:' (
ManagerBase) 4
<4 5
FollowedPeople5 C
>C D
,D E!
IFollowedUserServicesF [
{ 
private 
IRepository 
< 
FollowedPeople )
>) *
_repository+ 6
{7 8
get9 <
;< =
}> ?
private 
IUserServices 
_userServices *
{+ ,
get- 0
;0 1
}2 3
public !
EfFollowedUserManager $
($ %
IRepository% 0
<0 1
FollowedPeople1 ?
>? @

repositoryA K
,K L
IUserServicesM Z
userServices[ g
)g h
:i j
basek o
(o p

repositoryp z
)z {
{ 	
_repository 
= 

repository $
;$ %
_userServices 
= 
userServices (
;( )
} 	
public 
async 
Task 
< 
ResultMessage '
<' (
FollowedPeople( 6
>6 7
>7 8
FollowUserAsync9 H
(H I
intI L
flowIdM S
,S T
intU X
userIdY _
)_ `
{ 	
ResultMessage 
< 
FollowedPeople (
>( )
resultMessage* 7
=8 9
new: =
ResultMessage> K
<K L
FollowedPeopleL Z
>Z [
([ \
)\ ]
;] ^
if 
( 
flowId 
== 
userId 
) 
{ 
resultMessage 
. 
Errors $
=% &
new' *
ErrorMessageObj+ :
(: ;
ErrorMessageCode; K
.K L'
UserCouldNotFollewedHimselfL g
,g h
$str	i å
)
å ç
;
ç é
return 
resultMessage $
;$ %
} 
if 
( 
await 
_userServices #
.# $
Get$ '
(' (
p( )
=>* ,
p- .
.. /
Id/ 1
==2 4
flowId5 ;
); <
=== ?
null@ D
)D E
{   
resultMessage"" 
."" 
Errors"" $
=""% &
new""' *
ErrorMessageObj""+ :
("": ;
ErrorMessageCode""; K
.""K L
UserNotFound""L X
,""X Y
$str""Z x
)""x y
;""y z
return## 
resultMessage## $
;##$ %
}$$ 
var%% 
durum%% 
=%% 
await%% 
Get%% !
(%%! "
p%%" #
=>%%$ &
p%%' (
.%%( )

ObserverId%%) 3
==%%4 6
userId%%7 =
&&%%> @
p%%A B
.%%B C
TargetId%%C K
==%%L N
flowId%%O U
)%%U V
;%%V W
if&& 
(&& 
durum&& 
!=&& 
null&& 
)&& 
{'' 
resultMessage(( 
.(( 
Errors(( $
=((% &
new((' *
ErrorMessageObj((+ :
(((: ;
ErrorMessageCode((; K
.((K L
UserNotFound((L X
,((X Y
$str	((Z Ç
)
((Ç É
;
((É Ñ
return)) 
resultMessage)) $
;))$ %
}** 
var++ 
sonuc++ 
=++ 
await++ 
Insert++ "
(++" #
new++# &
FollowedPeople++' 5
(++5 6
)++6 7
{++8 9
TargetId++: B
=++C D
flowId++E K
,++K L

ObserverId++M W
=++X Y
userId++Z `
}++a b
)++b c
;++c d
if,, 
(,, 
sonuc,, 
>,, 
$num,, 
),, 
{-- 
resultMessage.. 
... 
Result.. $
=..% &
new..' *
FollowedPeople..+ 9
(..9 :
)..: ;
{..< =
TargetId..> F
=..G H
flowId..I O
,..O P

ObserverId..Q [
=..\ ]
userId..^ d
}..e f
;..f g
}// 
else00 
{11 
resultMessage22 
.22 
Errors22 $
=22% &
new22' *
ErrorMessageObj22+ :
(22: ;
ErrorMessageCode22; K
.22K L 
UserCouldNotFollowed22L `
,22` a
$str22b ~
)22~ 
;	22 Ä
}33 
return44 
resultMessage44  
;44  !
}55 	
}66 
}77 æ3
^C:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\EntityFramework\EfTagManager.cs
	namespace 	
Conduit
 
. 
Business 
. 
Managers #
.# $
EntityFramework$ 3
{ 
public 

class 
EfTagManager 
: 
ManagerBase  +
<+ ,
Tag, /
>/ 0
,0 1
ITagServices2 >
{ 
private 
readonly 
IRepository $
<$ %
Tag% (
>( )
_repository* 5
;5 6
private 
readonly 
IMapper  
_mapper! (
;( )
public 
EfTagManager 
( 
IRepository '
<' (
Tag( +
>+ ,

repository- 7
,7 8
IMapper9 @
mapperA G
)G H
:I J
baseK O
(O P

repositoryP Z
)Z [
{ 	
_repository 
= 

repository $
;$ %
_mapper 
= 
mapper 
; 
} 	
public 
new 
async 
Task 
< 
ResultMessage +
<+ ,
Tag, /
>/ 0
>0 1
DeleteAsync2 =
(= >
Tag> A
tagB E
)E F
{ 	
ResultMessage 
< 
Tag 
> 
resultMessage ,
=- .
new/ 2
ResultMessage3 @
<@ A
TagA D
>D E
(E F
)F G
;G H
var 
durum 
= 
await 
Get !
(! "
p" #
=>$ &
p' (
.( )
TagId) .
==/ 1
tag2 5
.5 6
TagId6 ;
); <
;< =
if 
( 
durum 
!= 
null 
) 
{ 
int   
sonuc   
=   
await   !
base  " &
.  & '
Delete  ' -
(  - .
durum  . 3
)  3 4
;  4 5
if!! 
(!! 
sonuc!! 
>!! 
$num!! 
)!! 
{"" 
resultMessage## !
.##! "
Result##" (
=##) *
null##+ /
;##/ 0
}$$ 
else%% 
{&& 
resultMessage'' !
.''! "
Errors''" (
='') *
new''+ .
ErrorMessageObj''/ >
(''> ?
ErrorMessageCode''? O
.''O P
TagCouldNotDeleted''P b
,''b c
$str''d ~
)''~ 
;	'' Ä
}(( 
})) 
else** 
{++ 
resultMessage,, 
.,, 
Errors,, $
=,,% &
new,,' *
ErrorMessageObj,,+ :
(,,: ;
ErrorMessageCode,,; K
.,,K L
TagNotFound,,L W
,,,W X
$str,,Y s
),,s t
;,,t u
}-- 
return.. 
resultMessage..  
;..  !
}// 	
public11 
new11 
async11 
Task11 
<11 
ResultMessage11 +
<11+ ,
Tag11, /
>11/ 0
>110 1
InsertAsync112 =
(11= >
Tag11> A
tag11B E
)11E F
{22 	
ResultMessage33 
<33 
Tag33 
>33 
resultMessage33 ,
=33- .
new33/ 2
ResultMessage333 @
<33@ A
Tag33A D
>33D E
(33E F
)33F G
;33G H
var44 
durum44 
=44 
await44 
Get44 !
(44! "
p44" #
=>44$ &
p44' (
.44( )
TagId44) .
==44/ 1
tag442 5
.445 6
TagId446 ;
)44; <
;44< =
if55 
(55 
durum55 
==55 
null55 
)55 
{66 
int77 
sonuc77 
=77 
await77 !
base77" &
.77& '
Insert77' -
(77- .
tag77. 1
)771 2
;772 3
if88 
(88 
sonuc88 
>88 
$num88 
)88 
{99 
resultMessage:: !
.::! "
Result::" (
=::) *
tag::+ .
;::. /
};; 
else<< 
{== 
resultMessage>> !
.>>! "
Errors>>" (
=>>) *
new>>+ .
ErrorMessageObj>>/ >
(>>> ?
ErrorMessageCode>>? O
.>>O P
TagCouldNotInserted>>P c
,>>c d
$str>>e 
)	>> Ä
;
>>Ä Å
}?? 
}@@ 
elseAA 
{BB 
resultMessageCC 
.CC 
ErrorsCC $
=CC% &
newCC' *
ErrorMessageObjCC+ :
(CC: ;
ErrorMessageCodeCC; K
.CCK L
TagAlreadyExistsCCL \
,CC\ ]
$strCC^ w
)CCw x
;CCx y
}DD 
returnEE 
resultMessageEE  
;EE  !
}FF 	
publicHH 
newHH 
asyncHH 
TaskHH 
<HH 
ListHH "
<HH" #
TagViewModelHH# /
>HH/ 0
>HH0 1
GetListHH2 9
(HH9 :
)HH: ;
{II 	
varJJ 
tagListJJ 
=JJ 
awaitJJ 
baseJJ  $
.JJ$ %
GetListJJ% ,
(JJ, -
)JJ- .
;JJ. /
varKK 
listKK 
=KK 
newKK 
ListKK 
<KK  
TagViewModelKK  ,
>KK, -
(KK- .
)KK. /
;KK/ 0
awaitLL 
TaskLL 
.LL 
RunLL 
(LL 
(LL 
)LL 
=>LL  
listLL! %
=LL& '
_mapperLL( /
.LL/ 0
MapLL0 3
<LL3 4
ListLL4 8
<LL8 9
TagLL9 <
>LL< =
,LL= >
ListLL? C
<LLC D
TagViewModelLLD P
>LLP Q
>LLQ R
(LLR S
tagListLLS Z
)LLZ [
)LL[ \
;LL\ ]
returnMM 
listMM 
;MM 
}NN 	
}OO 
}PP áh
_C:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\EntityFramework\EfUserManager.cs
	namespace 	
Conduit
 
. 
Business 
. 
Managers #
.# $
EntityFramework$ 3
{ 
public 

class 
EfUserManager 
:  
ManagerBase! ,
<, -
User- 1
>1 2
,2 3
IUserServices4 A
,A B
ITokenServicesC Q
{ 
private 
readonly 
IRepository $
<$ %
User% )
>) *
_repository+ 6
;6 7
private 
readonly 
IMapper  
_mapper! (
;( )
private $
IArticleFavoriteServices ($
_articleFavoriteServices) A
{B C
getD G
;G H
}I J
public 
EfUserManager 
( 
IRepository (
<( )
User) -
>- .

repository/ 9
,9 :
IMapper; B
mapperC I
)I J
:K L
baseM Q
(Q R

repositoryR \
)\ ]
{ 	
_mapper 
= 
mapper 
; 
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
User 
> 
GetUserAsync  ,
(, -
string- 3
username4 <
)< =
{ 	
var 
user 
= 
await 
Get 
(  
p  !
=>" $
p% &
.& '
UserName' /
==0 2
username3 ;
); <
;< =
return 
user 
; 
} 	
public   
async   
Task   
<   
ResultMessage   '
<  ' (
User  ( ,
>  , -
>  - .
InsertAsync  / :
(  : ;
UserDto  ; B
user  C G
)  G H
{!! 	
ResultMessage## 
<## 
User## 
>## 
resultMessage##  -
=##. /
new##0 3
ResultMessage##4 A
<##A B
User##B F
>##F G
(##G H
)##H I
;##I J
var$$ 
durum$$ 
=$$ 
await$$ 
Get$$  
($$  !
p$$! "
=>$$# %
p$$& '
.$$' (
UserName$$( 0
==$$1 3
user$$4 8
.$$8 9
UserName$$9 A
)$$A B
;$$B C
if%% 
(%% 
durum%% 
==%% 
null%% 
)%% 
{&& 
user(( 
.(( 
Salt(( 
=(( 
CryptoHelper(( (
.((( )
Salt(() -
(((- .
user((. 2
.((2 3
UserName((3 ;
)((; <
;((< =
user)) 
.)) 
Hash)) 
=)) 
CryptoHelper)) (
.))( )
Encrypt))) 0
())0 1
user))1 5
.))5 6
UserName))6 >
,))> ?
user))@ D
.))D E
Password))E M
)))M N
;))N O
var** 
userDoa** 
=** 
_mapper** %
.**% &
Map**& )
<**) *
User*** .
>**. /
(**/ 0
user**0 4
)**4 5
;**5 6
var++ 
sonuc++ 
=++ 
await++  
base++! %
.++% &
Insert++& ,
(++, -
userDoa++- 4
)++4 5
;++5 6
if,, 
(,, 
sonuc,, 
>,, 
$num,, 
),, 
{-- 
resultMessage.. !
...! "
Result.." (
=..) *
userDoa..+ 2
;..2 3
}// 
else00 
{11 
resultMessage22 !
.22! "
Errors22" (
=22) *
new22+ .
ErrorMessageObj22/ >
(22> ?
ErrorMessageCode22? O
.22O P 
UserCouldNotInserted22P d
,22d e
$str22f }
)22} ~
;22~ 
}33 
}55 
else66 
{77 
resultMessage88 
.88 
Errors88 $
=88% &
new88' *
ErrorMessageObj88+ :
{88; <
Code88= A
=88B C
ErrorMessageCode88D T
.88T U!
UsernameAlreadyExists88U j
,88j k
Message88l s
=88t u
$str	88v ô
}
88ö õ
;
88õ ú
}99 
return:: 
resultMessage::  
;::  !
};; 	
public== 
async== 
Task== 
<== 
ResultMessage== '
<==' (
User==( ,
>==, -
>==- .
UpdateAsync==/ :
(==: ;
UserDto==; B
userDto==C J
)==J K
{>> 	
ResultMessage?? 
<?? 
User?? 
>?? 
resultMessage??  -
=??. /
new??0 3
ResultMessage??4 A
<??A B
User??B F
>??F G
(??G H
)??H I
;??I J
varCC 
durumCC 
=CC 
awaitCC 
GetCC !
(CC! "
pCC" #
=>CC$ &
pCC' (
.CC( )
IdCC) +
!=CC, .
userDtoCC/ 6
.CC6 7
IdCC7 9
&&CC: <
pCC= >
.CC> ?
UserNameCC? G
.CCG H
ToLowerCCH O
(CCO P
)CCP Q
.CCQ R
EqualsCCR X
(CCX Y
userDtoCCY `
.CC` a
UserNameCCa i
.CCi j
ToLowerCCj q
(CCq r
)CCr s
)CCs t
)CCt u
;CCu v
ifDD 
(DD 
durumDD 
!=DD 
nullDD 
)DD 
{EE 
resultMessageGG 
.GG 
ErrorsGG $
=GG% &
newGG' *
ErrorMessageObjGG+ :
(GG: ;
ErrorMessageCodeGG; K
.GGK L!
UsernameAlreadyExistsGGL a
,GGa b
$str	GGc ü
)
GGü †
;
GG† °
returnHH 
resultMessageHH $
;HH$ %
}II 
varKK 
userKK 
=KK 
awaitKK 
GetKK  
(KK  !
pKK! "
=>KK# %
pKK& '
.KK' (
IdKK( *
==KK+ -
userDtoKK. 5
.KK5 6
IdKK6 8
)KK8 9
;KK9 :
ifLL 
(LL 
userLL 
==LL 
nullLL 
)LL 
{MM 
resultMessageOO 
.OO 
ErrorsOO $
=OO% &
newOO' *
ErrorMessageObjOO+ :
(OO: ;
ErrorMessageCodeOO; K
.OOK L
UserNotFoundOOL X
,OOX Y
$strOOZ x
)OOx y
;OOy z
returnPP 
resultMessagePP $
;PP$ %
}QQ 
userDtoRR 
.RR 
SaltRR 
=RR 
CryptoHelperRR '
.RR' (
SaltRR( ,
(RR, -
userDtoRR- 4
.RR4 5
UserNameRR5 =
)RR= >
;RR> ?
userDtoSS 
.SS 
HashSS 
=SS 
CryptoHelperSS '
.SS' (
EncryptSS( /
(SS/ 0
userDtoSS0 7
.SS7 8
UserNameSS8 @
,SS@ A
userDtoSSB I
.SSI J
PasswordSSJ R
)SSR S
;SSS T
varTT 
userDoaTT 
=TT 
_mapperTT !
.TT! "
MapTT" %
<TT% &
UserTT& *
>TT* +
(TT+ ,
userDtoTT, 3
)TT3 4
;TT4 5
userUU 
.UU 
IdUU 
=UU 
userDoaUU 
.UU 
IdUU  
;UU  !
userVV 
.VV 
HashVV 
=VV 
userDoaVV 
.VV  
HashVV  $
;VV$ %
userWW 
.WW 
	FirstNameWW 
=WW 
userDoaWW $
.WW$ %
	FirstNameWW% .
;WW. /
userXX 
.XX 
LastNameXX 
=XX 
userDoaXX #
.XX# $
LastNameXX$ ,
;XX, -
userYY 
.YY 
ImageYY 
=YY 
userDoaYY  
.YY  !
ImageYY! &
;YY& '
userZZ 
.ZZ 
UserNameZZ 
=ZZ 
userDoaZZ #
.ZZ# $
UserNameZZ$ ,
;ZZ, -
user[[ 
.[[ 
Salt[[ 
=[[ 
userDoa[[ 
.[[  
Salt[[  $
;[[$ %
user\\ 
.\\ 
Email\\ 
=\\ 
userDoa\\  
.\\  !
Email\\! &
;\\& '
user]] 
.]] 
Bio]] 
=]] 
userDoa]] 
.]] 
Bio]] "
;]]" #
var^^ 
sonuc^^ 
=^^ 
await^^ 
base^^ "
.^^" #
Update^^# )
(^^) *
user^^* .
)^^. /
;^^/ 0
if__ 
(__ 
sonuc__ 
>__ 
$num__ 
)__ 
{`` 
resultMessageaa 
.aa 
Resultaa $
=aa% &
useraa' +
;aa+ ,
}bb 
elsecc 
{dd 
resultMessageee 
.ee 
Errorsee $
=ee% &
newee' *
ErrorMessageObjee+ :
(ee: ;
ErrorMessageCodeee; K
.eeK L
UserCouldNotUpdatedeeL _
,ee_ `
$streea {
)ee{ |
;ee| }
}gg 
returnhh 
resultMessagehh  
;hh  !
}pp 	
publicrr 
asyncrr 
Taskrr 
<rr 
boolrr 
>rr +
IsValidUsernameAndPasswordAsyncrr  ?
(rr? @
stringrr@ F
usernamerrG O
,rrO P
stringrrQ W
passwordrrX `
)rr` a
{ss 	
vartt 
usertt 
=tt 
awaittt 
Gettt  
(tt  !
ptt! "
=>tt# %
ptt& '
.tt' (
UserNamett( 0
==tt1 3
usernamett4 <
)tt< =
;tt= >
ifuu 
(uu 
useruu 
==uu 
nulluu 
)uu 
{vv 
returnww 
falseww 
;ww 
}xx 
returnyy 
CryptoHelperyy 
.yy  
IsPasswordMatchyy  /
(yy/ 0
useryy0 4
.yy4 5
Hashyy5 9
,yy9 :
passwordyy; C
,yyC D
useryyE I
.yyI J
UserNameyyJ R
)yyR S
;yyS T
}zz 	
public|| 
async|| 
Task|| 
<|| 
ResultMessage|| '
<||' (
User||( ,
>||, -
>||- .
DeleteAsync||/ :
(||: ;
int||; >
id||? A
)||A B
{}} 	
ResultMessage~~ 
<~~ 
User~~ 
>~~ 
resultMessage~~  -
=~~. /
new~~0 3
ResultMessage~~4 A
<~~A B
User~~B F
>~~F G
(~~G H
)~~H I
;~~I J
var 
user 
= 
await 
Get  
(  !
p! "
=># %
p& '
.' (
Id( *
==+ -
id. 0
)0 1
;1 2
if
ÄÄ 
(
ÄÄ 
user
ÄÄ 
==
ÄÄ 
null
ÄÄ 
)
ÄÄ 
{
ÅÅ 
resultMessage
ÇÇ 
.
ÇÇ 
Errors
ÇÇ $
=
ÇÇ% &
new
ÇÇ' *
ErrorMessageObj
ÇÇ+ :
(
ÇÇ: ;
ErrorMessageCode
ÇÇ; K
.
ÇÇK L
UserNotFound
ÇÇL X
,
ÇÇX Y
$str
ÇÇZ x
)
ÇÇx y
;
ÇÇy z
return
ÉÉ 
resultMessage
ÉÉ $
;
ÉÉ$ %
}
ÑÑ 
var
ÖÖ 
sonuc
ÖÖ 
=
ÖÖ 
await
ÖÖ 
base
ÖÖ !
.
ÖÖ! "
Delete
ÖÖ" (
(
ÖÖ( )
user
ÖÖ) -
)
ÖÖ- .
;
ÖÖ. /
if
ÜÜ 
(
ÜÜ 
sonuc
ÜÜ 
>
ÜÜ 
$num
ÜÜ 
)
ÜÜ 
{
áá 
resultMessage
àà 
.
àà 
Result
àà $
=
àà% &
null
àà' +
;
àà+ ,
}
ââ 
else
ää 
{
ãã 
resultMessage
åå 
.
åå 
Errors
åå $
=
åå% &
new
åå' *
ErrorMessageObj
åå+ :
(
åå: ;
ErrorMessageCode
åå; K
.
ååK L!
UserCouldNotDeleted
ååL _
,
åå_ `
$str
ååa x
)
ååx y
;
ååy z
}
çç 
return
éé 
resultMessage
éé  
;
éé  !
}
èè 	
}
íí 
}ìì ﬁ
MC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Managers\ManagerBase.cs
	namespace		 	
Conduit		
 
.		 
Business		 
.		 
Managers		 #
{

 
public 

abstract 
class 
ManagerBase %
<% &
TEntity& -
>- .
where/ 4
TEntity5 <
:= >
class? D
{ 
private 
readonly 
IRepository $
<$ %
TEntity% ,
>, -
_repository. 9
;9 :
public 
ManagerBase 
( 
IRepository &
<& '
TEntity' .
>. /

repository0 :
): ;
{ 	
_repository 
= 

repository $
;$ %
} 	
public 
async 
Task 
< 
List 
< 
TEntity &
>& '
>' (
GetList) 0
(0 1
)1 2
{ 	
return 
await 
_repository $
.$ %
GetList% ,
(, -
)- .
;. /
} 	
public 
async 
Task 
< 
TEntity !
>! "
Get# &
(& '

Expression' 1
<1 2
Func2 6
<6 7
TEntity7 >
,> ?
bool@ D
>D E
>E F

expressionG Q
)Q R
{ 	
return 
await 
_repository $
.$ %
Get% (
(( )

expression) 3
)3 4
;4 5
} 	
public 
async 
Task 
< 
int 
> 
Insert %
(% &
TEntity& -
entity. 4
)4 5
{ 	
return 
await 
_repository $
.$ %
Insert% +
(+ ,
entity, 2
)2 3
;3 4
}   	
public"" 
async"" 
Task"" 
<"" 
int"" 
>"" 
Update"" %
(""% &
TEntity""& -
entity"". 4
)""4 5
{## 	
return$$ 
await$$ 
_repository$$ $
.$$$ %
Update$$% +
($$+ ,
entity$$, 2
)$$2 3
;$$3 4
}%% 	
public'' 
async'' 
Task'' 
<'' 
int'' 
>'' 
Delete'' %
(''% &
TEntity''& -
entity''. 4
)''4 5
{(( 	
return)) 
await)) 
_repository)) $
.))$ %
Delete))% +
())+ ,
entity)), 2
)))2 3
;))3 4
}** 	
public,, 

IQueryable,, 
<,, 
TEntity,, !
>,,! "
GetQueryable,,# /
(,,/ 0

Expression,,0 :
<,,: ;
Func,,; ?
<,,? @
TEntity,,@ G
,,,G H
bool,,I M
>,,M N
>,,N O

expression,,P Z
),,Z [
{-- 	
return.. 
_repository.. 
... 
GetQueryable.. +
(..+ ,

expression.., 6
)..6 7
;..7 8
}// 	
public11 

IQueryable11 
<11 
TEntity11 !
>11! "
GetIncludes11# .
(11. /
params11/ 5

Expression116 @
<11@ A
Func11A E
<11E F
TEntity11F M
,11M N
object11O U
>11U V
>11V W
[11W X
]11X Y
includes11Z b
)11b c
{22 	
return33 
_repository33 
.33 
GetIncludes33 *
(33* +
includes33+ 3
)333 4
;334 5
}44 	
}55 
}66 ¡
RC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Messages\ErrorMessageCode.cs
	namespace 	
Conduit
 
. 
Business 
. 
Messages #
{ 
public 

enum 
ErrorMessageCode  
{ 
CriticalError		 
=		 
$num		 
,		 !
UsernameAlreadyExists

 
=

 
$num

  #
,

# $
EmailAlreadyExists 
= 
$num  
,  !
UsernameOrPassWrong 
= 
$num !
,! "
UserAlreadyActive 
= 
$num 
,  
UserNotFound 
= 
$num 
, 
ArticleNotFound 
= 
$num 
, (
ArticleFavoriteAlreadyExists $
=% &
$num' *
,* ++
ArticleFavoriteCouldNotInserted '
=( )
$num* -
,- . 
UserCouldNotInserted 
= 
$num "
," #
UserCouldNotUpdated 
= 
$num !
,! "
UserCouldNotDeleted 
= 
$num !
,! "'
UserCouldNotFollewedHimself #
=$ %
$num& )
,) * 
UserCouldNotFollowed 
= 
$num "
," #"
ArticleCouldNotDeleted 
=  
$num! $
,$ %$
ArticleSlugAlreadyExists  
=! "
$num# &
,& '#
ArticleCouldNotInserted 
=  !
$num" %
,% &"
ArticleCouldNotUpdated 
=  
$num! $
,$ %&
ArticleTagCouldNotInserted "
=# $
$num% (
,( )
TagNotFound 
= 
$num 
, #
ArticleTagAlreadyExists 
=  !
$num" %
,% &
TagAlreadyExists 
= 
$num 
, 
TagCouldNotInserted 
= 
$num !
,! "
TagCouldNotDeleted   
=   
$num    
,    !#
CommentCouldNotInserted!! 
=!!  !
$num!!" %
,!!% &"
CommentCouldNotUpdated"" 
=""  
$num""! $
,""$ %
CommentNotFound## 
=## 
$num## 
,## "
CommentCouldNotDeleted$$ 
=$$  
$num$$! $
,$$$ %
}%% 
}&& Ã
QC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Messages\ErrorMessageObj.cs
	namespace 	
Conduit
 
. 
Business 
. 
Messages #
{ 
public 

class 
ErrorMessageObj  
{ 
public		 
ErrorMessageObj		 
(		 
)		  
{

 	
} 	
public 
ErrorMessageObj 
( 
ErrorMessageCode /
code0 4
,4 5
string5 ;
message< C
)C D
{ 	
Code 
= 
code 
; 
Message 
= 
message 
; 
} 	
public 
ErrorMessageCode 
Code  $
{% &
get' *
;* +
set, /
;/ 0
}1 2
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} Ë
OC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Messages\ResultMessage.cs
	namespace 	
Conduit
 
. 
Business 
. 
Messages #
{ 
public 

class 
ResultMessage 
< 
T  
>  !
where" '
T( )
:* +
class, 1
{ 
public		 
ErrorMessageObj		 
Errors		 %
{		& '
get		( +
;		+ ,
set		- 0
;		0 1
}		2 3
public

 
T

 
Result

 
{

 
get

 
;

 
set

 "
;

" #
}

$ %
} 
} à
ZC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\IArticleFavoriteServices.cs
	namespace 	
Conduit
 
. 
Business 
. 
Services #
{		 
public

 

	interface

 $
IArticleFavoriteServices

 -
{ 
Task 
< 
ResultMessage 
< 
ArticleFavorite *
>* +
>+ ,
AddFavoriteArticle- ?
(? @
int@ C
userIdD J
,J K
intL O
	articleIdP Y
)Y Z
;Z [
} 
} Ë
RC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\IArticleServices.cs
	namespace 	
Conduit
 
. 
Business 
. 
Services #
{ 
public 

	interface 
IArticleServices %
{ 
Task 
< 
List 
< 
Article 
> 
> 
GetList #
(# $
)$ %
;% &
Task 
< 
ArticleListModel 
> 
GetListModel +
(+ ,
ArticleQuery, 8
query9 >
)> ?
;? @
Task 
< 
ResultMessage 
< 
Article "
>" #
># $
Insert% +
(+ ,
Article, 3
article4 ;
); <
;< =
Task 
< 
ResultMessage 
< 
Article "
>" #
># $
Update% +
(+ ,
Article, 3
article4 ;
); <
;< =
Task 
< 
ResultMessage 
< 
Article "
>" #
># $
Delete% +
(+ ,
int, /
id0 2
)2 3
;3 4
Task 
< 
Article 
> 
Get 
( 

Expression $
<$ %
Func% )
<) *
Article* 1
,1 2
bool3 7
>7 8
>8 9

expression: D
)D E
;E F

IQueryable 
< 
Article 
> 
GetQueryable (
(( )

Expression) 3
<3 4
Func4 8
<8 9
Article9 @
,@ A
boolB F
>F G
>G H

expressionI S
)S T
;T U

IQueryable 
< 
Article 
> 
GetIncludes '
(' (
params( .

Expression/ 9
<9 :
Func: >
<> ?
Article? F
,F G
objectH N
>N O
>O P
[P Q
]Q R
includesS [
)[ \
;\ ]
} 
} õ
VC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\IArticleTagsServices.cs
	namespace

 	
Conduit


 
.

 
Business

 
.

 
Services

 #
{ 
public 

	interface  
IArticleTagsServices )
{ 
Task 
< 
List 
< 

ArticleTag 
> 
> 
GetList &
(& '
)' (
;( )
Task 
< 
ResultMessage 
< 

ArticleTag %
>% &
>& '
Insert( .
(. /

ArticleTag/ 9

articleTag: D
)D E
;E F
Task 
< 
int 
> 
Update 
( 

ArticleTag #

articleTag$ .
). /
;/ 0
Task 
< 
int 
> 
Delete 
( 

ArticleTag #

articleTag$ .
). /
;/ 0
Task 
< 

ArticleTag 
> 
Get 
( 

Expression '
<' (
Func( ,
<, -

ArticleTag- 7
,7 8
bool9 =
>= >
>> ?

expression@ J
)J K
;K L

IQueryable 
< 

ArticleTag 
> 
GetIncludes *
(* +
params+ 1

Expression2 <
<< =
Func= A
<A B

ArticleTagB L
,L M
objectN T
>T U
>U V
[V W
]W X
includesY a
)a b
;b c
} 
} å
RC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\ICommentSercices.cs
	namespace 	
Conduit
 
. 
Business 
. 
Services #
{ 
public 

	interface 
ICommentSercices %
{ 
Task 
< 
List 
< 

CommentDto 
> 
> 
GetListAsync +
(+ ,
), -
;- .
Task 
< 
ResultMessage 
< 

CommentDto %
>% &
>& '
InsertAsync( 3
(3 4

CommentDto4 >

commentDto? I
)I J
;J K
Task 
< 
ResultMessage 
< 

CommentDto %
>% &
>& '
UpdateAsync( 3
(3 4

CommentDto4 >

commentDto? I
)I J
;J K
Task 
< 
ResultMessage 
< 

CommentDto %
>% &
>& '
DeleteAsync( 3
(3 4
int4 7
id8 :
): ;
;; <
Task 
< 
Comment 
> 
Get 
( 

Expression $
<$ %
Func% )
<) *
Comment* 1
,1 2
bool3 7
>7 8
>8 9

expression: D
)D E
;E F

IQueryable 
< 
Comment 
> 
GetIncludes '
(' (
params( .

Expression/ 9
<9 :
Func: >
<> ?
Comment? F
,F G
objectH N
>N O
>O P
[P Q
]Q R
includesS [
)[ \
;\ ]
} 
} ˚
WC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\IFollowedUserServices.cs
	namespace 	
Conduit
 
. 
Business 
. 
Services #
{		 
public

 	
	interface


 !
IFollowedUserServices

 )
{ 
Task 
< 
ResultMessage 
< 
FollowedPeople )
>) *
>* +
FollowUserAsync, ;
(; <
int< ?
flowId@ F
,F G
intH K
userIdL R
)R S
;S T
} 
} ﬂ
NC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\ITagServices.cs
	namespace 	
Conduit
 
. 
Business 
. 
Services #
{ 
public 

	interface 
ITagServices !
{ 
Task 
< 
Tag 
> 
Get 
( 

Expression  
<  !
Func! %
<% &
Tag& )
,) *
bool* .
>. /
>/ 0

expression1 ;
); <
;< =
Task 
< 
List 
< 
TagViewModel 
> 
>  
GetList! (
(( )
)) *
;* +
Task 
< 
ResultMessage 
< 
Tag 
> 
>  
InsertAsync! ,
(, -
Tag- 0
tag1 4
)4 5
;5 6
Task 
< 
ResultMessage 
< 
Tag 
> 
>  
DeleteAsync! ,
(, -
Tag- 0
tag1 4
)4 5
;5 6

IQueryable 
< 
Tag 
> 
GetIncludes #
(# $
params$ *

Expression+ 5
<5 6
Func6 :
<: ;
Tag; >
,> ?
object@ F
>F G
>G H
[H I
]I J
includesK S
)S T
;T U
} 
} ˜
PC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\ITokenServices.cs
	namespace 	
Conduit
 
. 
Business 
. 
Services #
{		 
public

 

	interface

 
ITokenServices

 #
{ 
Task 
< 
bool 
> +
IsValidUsernameAndPasswordAsync 2
(2 3
string3 9
username: B
,B C
stringC I
passwordJ R
)R S
;S T
Task 
< 
User 
> 
GetUserAsync 
(  !
string! '
username( 0
)0 1
;1 2
} 
} À
OC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\Services\IUserServices.cs
	namespace 	
Conduit
 
. 
Business 
. 
Services #
{ 
public 

	interface 
IUserServices "
{ 
Task 
< 
List 
< 
User 
> 
> 
GetList  
(  !
)! "
;" #
Task 
< 
ResultMessage 
< 
User 
>  
>  !
InsertAsync" -
(- .
UserDto. 5
user6 :
): ;
;; <
Task 
< 
ResultMessage 
< 
User 
>  
>  !
UpdateAsync" -
(- .
UserDto. 5
user6 :
): ;
;; <
Task 
< 
ResultMessage 
< 
User 
>  
>  !
DeleteAsync" -
(- .
int. 1
id2 4
)4 5
;5 6
Task 
< 
User 
> 
Get 
( 

Expression !
<! "
Func" &
<& '
User' +
,+ ,
bool- 1
>1 2
>2 3

expression4 >
)> ?
;? @

IQueryable 
< 
User 
> 
GetIncludes $
($ %
params% +

Expression, 6
<6 7
Func7 ;
<; <
User< @
,@ A
objectB H
>H I
>I J
[J K
]K L
includesM U
)U V
;V W
} 
} ∫
TC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\ViewModels\ArticleListModel.cs
	namespace 	
Conduit
 
. 
Business 
. 

ViewModels %
{ 
public 

class 
ArticleListModel !
{		 
public

 
List

 
<

 
ArticleViewModel

 $
>

$ %
Articles

& .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
int 

TotalCount 
{ 
get  #
;# $
set% (
;( )
}* +
} 
} ú
PC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\ViewModels\ArticleQuery.cs
	namespace 	
Conduit
 
. 
Business 
. 

ViewModels %
{ 
public

 

class

 
ArticleQuery

 
{ 
public 
ArticleQuery 
( 
string "
tag# &
,& '
int( +
?+ ,
offset- 3
,3 4
int5 8
?8 9
limit: ?
)? @
{ 	
TagId 
= 
tag 
; 
Limit 
= 
limit 
?? 
$num 
;  
Offset 
= 
offset 
?? 
$num  
;  !
} 	
public 
ArticleQuery 
( 
) 
{ 	
Limit 
= 
$num 
; 
Offset 
= 
$num 
; 
} 	
public 
int 
Limit 
{ 
get 
; 
set  #
;# $
}% &
public 
int 
Offset 
{ 
get 
;  
set! $
;$ %
}& '
public 
string 
TagId 
{ 
get !
;! "
set# &
;& '
}( )
} 
} ï
TC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\ViewModels\ArticleViewModel.cs
	namespace 	
Conduit
 
. 
Business 
. 

ViewModels %
{ 
public		 

class		 
ArticleViewModel		 !
{

 
public 
int 
Id 
{ 
get 
; 
set  
;  !
}" #
public 
int 
? 
AuthorUserId  
{! "
get# &
;& '
set( +
;+ ,
}- .
public 
string 
Body 
{ 
get  
;  !
set" %
;% &
}' (
public 
DateTime 
	CreatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Description !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
Slug 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Title 
{ 
get !
;! "
set# &
;& '
}( )
public 
DateTime 
	UpdatedAt !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
UserDto 

AuthorUser !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
List 
< 
string 
> 
Tags  
{! "
get# &
;& '
set( +
;+ ,
}- .
} 
} ÿ
PC:\Users\EXT02D13704\Desktop\Conduit\Conduit.Business\ViewModels\TagViewModel.cs
	namespace 	
Conduit
 
. 
Business 
. 

ViewModels %
{ 
public 	
class
 
TagViewModel 
{ 
public		 
string		 
Tag		 
{		 
get		 
;		  
set		! $
;		$ %
}		& '
}

 
} 