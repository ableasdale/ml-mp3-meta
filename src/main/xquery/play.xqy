xquery version "1.0-ml";

declare variable $fname as xs:string := xdmp:get-request-field("uri");
declare variable $size as xs:double := xs:double(doc($fname)//size);

(xdmp:set-response-content-type("audio/mpeg"),xdmp:external-binary($fname, 1, $size))
