xquery version "1.0-ml";

declare variable $fname as xs:string := xdmp:get-request-field("uri");
declare variable $size as xs:double := xs:double(doc($fname)//size);


(
 
  (:  (for $x in xdmp:get-request-header-names() 
    return xdmp:log(text {$x, " | ", xdmp:get-request-header($x)})),   :)
    
    
    xdmp:add-response-header("Content-Range", concat("bytes 0-",xs:unsignedLong((doc($fname)//size) - 1), "/", (doc($fname)//size) )),
    xdmp:add-response-header("Accept-Ranges", "bytes"), 
    
    
    xdmp:set-response-content-type("audio/mpeg"), (: ; name="test.mp3"' :)
    xdmp:log(xdmp:binary-is-large(xdmp:external-binary($fname))),
    if (fn:string-length(xdmp:get-request-header("Range")) gt 1)
    then (xdmp:subbinary(xdmp:external-binary($fname), 0, 99999999))
    else (xdmp:external-binary($fname))
)
