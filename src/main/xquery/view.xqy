xquery version "1.0-ml";

declare variable $fname as xs:string := xdmp:get-request-field("uri");

(
<h1>{$fname}</h1>,
<pre>{
doc(xdmp:url-decode($fname))
}</pre>
)