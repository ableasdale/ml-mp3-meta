xquery version "1.0-ml";

import module namespace common = "http://www.example.com/common" at "/lib/common.xqy";

declare variable $fname as xs:string := xdmp:get-request-field("uri");

common:build-page(
<div id="content">
    <h1>{$fname}</h1>
    
    <audio controls="controls">
        <source src="play.xqy?uri={$fname}" type="audio/mpeg" />
        Your browser does not support the audio element.
    </audio> 
    <h2>Metadata</h2>
    <dl>
    {
        for $i in doc($fname)/Item/*
        return (element dt {fn:local-name($i)}, element dd {$i/text()})
    }
    </dl>        
</div>)
