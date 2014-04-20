xquery version "1.0-ml";

(: Simple example for document-filter  :)

declare namespace h = "http://www.w3.org/1999/xhtml";

declare variable $fname as xs:string := xdmp:get-request-field("filename");
declare variable $mp3file := xdmp:get-request-body();

let $x := xdmp:document-filter($mp3file)
return xdmp:document-insert($fname,
    element Item {
      element Title{$x/h:html/h:head/h:title/string()},
      for $y in $x/h:html/h:head/h:meta
      return element {fn:data($y/@name)} {fn:data($y/@content)}
    }
)