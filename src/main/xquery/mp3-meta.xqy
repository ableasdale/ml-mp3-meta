xquery version "1.0-ml";

(: Simple example for document-filter  :)

declare variable $fname as xs:string := xdmp:get-request-field("filename");
declare variable $mp3file := xdmp:get-request-body();

(
xdmp:log($fname),
xdmp:log(xdmp:document-filter($mp3file))
)

(:
let $doc :=  xdmp:document-get($fname,
       <options xmlns="xdmp:document-get"
                xmlns:http="xdmp:http">
           <format>binary</format>
       </options>)
return
xdmp:document-filter($doc)
:)