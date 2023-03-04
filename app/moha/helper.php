<?php

use App\Models\Product;

function APIEncrypt ($key, $value){
    $padSize = 16 - (strlen ($value) % 16) ;
    $value = $value . str_repeat (chr ($padSize), $padSize) ;
    $output = mcrypt_encrypt (MCRYPT_RIJNDAEL_128, $key, $value, MCRYPT_MODE_CBC, str_repeat(chr(0),16)) ;
    return base64_encode ($output) ;
}

function get_country_helper(){
    $country = session()->get("country");

    if($country !=[] || $country !=""){
        if(is_array($country)){
            if(isset($country["rate"]) && isset($country["currency"]) ){


                return $country["name_en"];

            }
        }
    }
    return "Kuwait";
}


function get_currency_helper(){
    $country = session()->get("country");
    $currency = session()->get("currency");
    $currency_def=	\App\Models\Currency::first()->name;

    if($currency != [] || $currency != null) {
        $currency_def=$currency->name;

    }elseif($country !=[] || $country != null){
        $m_Country=	\App\Models\Currency::firstwhere('id',$country->currency_id);
        if($m_Country){
            $currency_def= $m_Country->name;
        }

    }elseif(Auth::guard('web')->check()){
        $m_Country=	\App\Models\Country::with('currency')
            ->firstwhere('id',Auth::guard('web')->user()->country_id);
        if($m_Country){
            $currency_def= $m_Country->currency->name;
        }
    }
    return $currency_def;
}
function get_currency_code_helper(){
    $country = session()->get("country");
    $currency = session()->get("currency");
    $currency_def=	\App\Models\Currency::first()->code;

    if($currency != [] || $currency != null) {
        $currency_def=$currency->code;

    }elseif($country !=[] || $country != null){
        $m_Country=	\App\Models\Currency::firstwhere('id',$country->currency_id);
        if($m_Country){
            $currency_def= $m_Country->code;
        }

    }elseif(Auth::guard('web')->check()){
        $m_Country=	\App\Models\Country::with('currency')
            ->firstwhere('id',Auth::guard('web')->user()->country_id);
        if($m_Country){
            $currency_def= $m_Country->currency->code;
        }
    }
    return $currency_def;
}
function get_price_helper($price){
    $country = session()->get("country");
    $currency = session()->get("currency");
    if($currency !=[] || $currency != null){
        $pr_ice =   ( $price / $currency->rate   );

        return   round($pr_ice,2) ."" .$currency->code;
    }
    if(($country !=[] || $country == null ) && Auth::guard('web')->check()){
        $m_Country=	App\Models\Country::with('currency')->firstwhere('id',Auth::guard('web')->user()->country_id);
        if($m_Country && $m_Country->currency != null ){
            $pr_ice =   ( $price /$m_Country->currency->rate   );

            return   round($pr_ice,2) ." " .$m_Country->currency->code;

        }
    }
    if($country !=[] || $country !=""){
        if(is_array($country)){
            if(isset($country["rate"]) && isset($country["currency"]) ){
                $pr_ice =   ( $country["rate"] * $price );

                return   round($pr_ice,2) ." " .$country["currency"];

            }
        }
    }
    return $price .' '.__('site.DZD');
}



function sms($from,$to,$text){
    $ch = curl_init();

    curl_setopt($ch, CURLOPT_URL, 'https://rest.nexmo.com/sms/json');
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, "from=".$from."&text=".$text."&to=".$to."&type=unicode&api_key=a30529bc&api_secret=sPDNkPwRFVyABc1w");

    $headers = array();
    $headers[] = 'Content-Type: application/x-www-form-urlencoded';
    curl_setopt($ch, CURLOPT_ENCODING, 'UTF-8');
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);

    $result = curl_exec($ch);
    if (curl_errno($ch)) {
//  echo 'Error:' . curl_error($ch);
        return false;
    }else{
        return true;
    }
    curl_close($ch);

}

function get_response($state,$msg,$data)
{
    $response=[
        "state"=>$state,
        "msg"=>$msg,
        "data"=>$data

    ];

    return  response()->json($response);


}


function btween($model,$min,$max)
{


    $record = $model::whereBetween('created_at', [$min, $max])->get();
    return $record ;

}



/////////////////////////////////////////////////////////////////

function notifyByFirebase($title, $body, $tokens, $data = [],$is_notification=true)
{

    $registrationIDs = $tokens;

    $fcmMsg = array(
        'body' => $body,
        'title' => $title,
        'sound' => "default",
        'color' => "#203E78"
    );
    $fcmFields = array(
        'registration_ids' => $registrationIDs,
        'priority' => 'high',
        'data' => $data
    );



    if ($is_notification)
    {
        $fcmFields['notification'] = $fcmMsg;
    }


    $headers = array(
        'Authorization: key=' . env('FIREBASE_API_ACCESS_KEY'),
        'Content-Type: application/json'
    );

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, 'https://fcm.googleapis.com/fcm/send');
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmFields));
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}





function getCiteis(){
    $url =env('API_YALIDINE_URL')."/wilayas/"; // the wilayas endpoint
    $api_id = env('API_YALIDINE_ID'); // your api ID
    $api_token = env('API_YALIDINE_TOKEN'); // your api token

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'X-API-ID: '. $api_id,
            'X-API-TOKEN: '. $api_token
        ),
    ));

    $response_json = curl_exec($curl);
    curl_close($curl);

    $response_array = json_decode($response_json,true);
    return $response_array;
}
function getCityOne($id){
    $url = env('API_YALIDINE_URL')."/wilayas/".$id; // the wilayas endpoint
    $api_id = env('API_YALIDINE_ID'); // your api ID
    $api_token = env('API_YALIDINE_TOKEN'); // your api token

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'X-API-ID: '. $api_id,
            'X-API-TOKEN: '. $api_token
        ),
    ));

    $response_json = curl_exec($curl);
    curl_close($curl);

    $response_array = json_decode($response_json,true);

    return $response_array;
}
function getCiteisWithPrices(){
    $url =env('API_YALIDINE_URL')."/deliveryfees/"; // the wilayas endpoint
    $api_id = env('API_YALIDINE_ID'); // your api ID
    $api_token = env('API_YALIDINE_TOKEN'); // your api token

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'X-API-ID: '. $api_id,
            'X-API-TOKEN: '. $api_token
        ),
    ));

    $response_json = curl_exec($curl);
    curl_close($curl);
    $response_array = json_decode($response_json,true);
    return $response_array;
}
function getCityPrice($id){
    $url = env('API_YALIDINE_URL')."/deliveryfees/".$id; // the wilayas endpoint
    $api_id = env('API_YALIDINE_ID'); // your api ID
    $api_token = env('API_YALIDINE_TOKEN'); // your api token

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'X-API-ID: '. $api_id,
            'X-API-TOKEN: '. $api_token
        ),
    ));

    $response_json = curl_exec($curl);
    curl_close($curl);

    $response_array = json_decode($response_json,true)['data'][0];

    return $response_array;
}
function getCityPricearray($ids){
    $url = "https://api.yalidine.app/v1/wilayas/"; // the wilayas endpoint
    $api_id = env('API_YALIDINE_ID'); // your api ID
    $api_token = env('API_YALIDINE_TOKEN'); // your api token

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'X-API-ID: '. $api_id,
            'X-API-TOKEN: '. $api_token
        ),
    ));

    $response_json = curl_exec($curl);
    curl_close($curl);

    $response_array = json_decode($response_json,true);
    return $response_json;
}

function getCenters($city_id){
    $url = "https://api.yalidine.app/v1/centers/$city_id"; // the wilayas endpoint
    $api_id = env('API_YALIDINE_ID'); // your api ID
    $api_token = env('API_YALIDINE_TOKEN'); // your api token

    $curl = curl_init();

    curl_setopt_array($curl, array(
        CURLOPT_URL => $url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => '',
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 0,
        CURLOPT_FOLLOWLOCATION => true,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => 'GET',
        CURLOPT_HTTPHEADER => array(
            'X-API-ID: '. $api_id,
            'X-API-TOKEN: '. $api_token
        ),
    ));
    $response_json = curl_exec($curl);
    curl_close($curl);

    $response_array = json_decode($response_json,true);
    return $response_array;
}
function sumALLPriceDelivry($product_ids , $govern){
    $response_array=[];
    $Products=Product::with('students:id,area_id')->wherein('id',$product_ids)->select('id')->get();
    $arr_cities_ids=[];
    foreach ($Products as $Product){
       $student= $Product->students->first();
       if($student){

           $arr_cities_ids[$student->area_id]=1;
       }else{
           $arr_cities_ids[0]=1;
       }
    }
    $count_cites=env('BY_COUNT_CITY',false)?count($arr_cities_ids):1;
    $response_array['cities_ids']= $arr_cities_ids;
    $response_array['shipping_price']= $govern->shipping_price * $count_cites;
    $response_array['shipping_price_desk']= $govern->shipping_price_desk * $count_cites;
    return $response_array;
}
?>
