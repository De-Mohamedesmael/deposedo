<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\AreaRequest;
use App\Models\Area;
use App\Models\Country;
use App\MyDataTable\MDT_Method_Action;
use App\MyDataTable\MDT_Query;
use Illuminate\Http\Request;

class AreaController extends Controller
{

    use MDT_Query , MDT_Method_Action;

    protected $lang;

    public function __construct()
    {
        $this->lang = app()->getLocale();

        $this->middleware('haveRole:area.index')->only('index');
        $this->middleware('haveRole:area.create')->only(['create' , 'store']);
        $this->middleware('haveRole:area.update')->only('update');
        $this->middleware('haveRole:area.destroy')->only('destroy');
        $this->middleware('haveRole:area.restore')->only('restore');
        $this->middleware('haveRole:area.finalDelete')->only('finalDelete');

    }


    public function index()
    {

        $is_trash  = \request()->segment(2) === 'trash';

        $countries = Country::get(['id' , "name_$this->lang"])
            ->pluck("name_$this->lang" , 'id')->all();

        return  $this->MDT_Query_method(// Start Query
            Area::class ,
            'admin/pages/areas/index',
            $is_trash, // Soft Delete
            [ // Other Options
                'with'    => ['is_trash' => $is_trash , 'countries' => $countries],
            ]

        ); // end query
    }

    public function indexYalidine()
    {
        $url = env('API_YALIDINE_URL')."/wilayas/"; // the wilayas endpoint
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
        foreach($response_array['data'] as $response_item){
            $Area=  Area::where('name_en','LIKE','%'.$response_item['name'].'%')->first();
            if($Area){
                $Area->wilaya_id=$response_item['id'];
                $cit=getCityPrice($response_item['id']);
                $Area->shipping_price=$cit['home_fee'];
                $Area->shipping_price_desk=$cit['desk_fee'];
                $Area->save();
            }
        }
        return redirect()->route('admin.areas.index')->with('success','Done');
    }
    public function create()
    {

        $countries  = Country::latest('id')->get(['id' , "name_$this->lang"]);

        return  view('admin.pages.areas.create')->with([

            'countries' => $countries,
            'lang' => $this->lang
        ]);
    }


    public function store(AreaRequest $request)
    {
        Area::create([
            'name_ar'        => $request->name_ar,
            'name_en'        => $request->name_en,
            'slug'           => strlen($request->slug) ? $request->slug : \Str::slug($request->name_ar),
            'shipping_price' => $request->shipping_price,
            'shipping_price_desk' => $request->shipping_price_desk,
    //          'cache'          => $request->cache,
            'country_id'     => $request->country_id,
        ]);



        return  back()->with('success' ,__('form.response.create area'));
    }


    public function update(AreaRequest $request, $id)
    {

        $area = Area::withTrashed()
            ->where('id' , $id)
            ->update([
                'name_ar'        => $request->name_ar,
                'name_en'        => $request->name_en,
                'slug'           => $request->slug,
                'shipping_price' => $request->shipping_price,
                'shipping_price_desk' => $request->shipping_price_desk,
                //            'cache'          => $request->cache,
                'country_id'     => $request->country_id,
            ]);

        return response(['status' => 'success' , 'message' => __('form.response.update area')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return $this->MDT_delete(Area::class , $id);
    }


    public function restore($id)
    {

        return $this->MDT_restore(Area::class , $id);
    }

    public function finalDelete($id)
    {
        return $this->MDT_finalDelete(Area::class , $id);
    }
}
