<?php
include '../config/connection.php';
include 'session.php';

$input=json_decode(file_get_contents("php://input"),true);
// $input = json_decode(file_get_contents('php://input'), true);

$msg=$input['msg'];

function call_llm($msg){
    $GROQ_API_KEY='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';
    $curl=curl_init();
    // curl -X POST "https://api.groq.com/openai/v1/chat/completions" \
    //  -H "Authorization: Bearer $GROQ_API_KEY" \
    //  -H "Content-Type: application/json" \
    //  -d '{"messages": [{"role": "user", "content": "Explain the importance of fast language models"}], "model": "llama-3.3-70b-versatile"}'
    // curl_setopt($curl,CURL_SSL_VERIFYHOST,0);
    // curl_setopt($curl,CURL_SSL_VERIFYPEER,0);
    curl_setopt($curl,CURLOPT_URL,"https://api.groq.com/openai/v1/chat/completions");
    curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
    
    $headers=["Authorization: Bearer $GROQ_API_KEY","Content-Type: application/json"];
    curl_setopt($curl,CURLOPT_HTTPHEADER,$headers);
    $data=[
        "messages"=> [
           [ 
            "role"=> "user", 
            "content"=> "$msg"
           ]
        ], 
        "model"=> "llama-3.3-70b-versatile"
    ];
    curl_setopt($curl,CURLOPT_POST,1);
    curl_setopt($curl,CURLOPT_POSTFIELDS,json_encode($data));
    $response=curl_exec($curl);

    return $response;
}

if (checkSession($conn)){

$msg=htmlspecialchars($msg);

echo call_llm($msg);
}



?>