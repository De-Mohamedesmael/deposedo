<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\PackagePeriodRequest;
use App\Models\Package;
use App\Models\Country;
use App\Models\PackageFeature;
use App\Models\PackagePeriod;
use App\MyDataTable\MDT_Method_Action;
use App\MyDataTable\MDT_Query;
use Illuminate\Http\Request;

class PeriodController extends Controller
{

    use MDT_Query, MDT_Method_Action;

    protected $lang;

    public function __construct()
    {
        $this->lang = app()->getLocale();
        $this->middleware('haveRole:package_periods.index')->only('index');
        $this->middleware('haveRole:package_periods.create')->only(['create' , 'store']);
        $this->middleware('haveRole:package_periods.update')->only('update');
        $this->middleware('haveRole:package_periods.destroy')->only('destroy');
        $this->middleware('haveRole:package_periods.restore')->only('restore');
        $this->middleware('haveRole:package_periods.finalDelete')->only('finalDelete');
    }


    public function index()
    {
        $is_trash  = \request()->segment(3) === 'trash';
        $packages = Package::pluck("name_$this->lang", 'id')->all();
        return  $this->MDT_Query_method(// Start Query
            PackagePeriod::class ,
            'admin/pages/packages/periods/index',
            $is_trash, // Soft Delete
            [ // Other Options
                'with'       => ['is_trash' => $is_trash,'packages'=>$packages],
            ]

        ); // end query

    }

    public function show($id)
    {
        $is_trash  = \request()->segment(3) === 'trash';
        $packages = Package::pluck("name_$this->lang", 'id')->all();
        return  $this->MDT_Query_method(// Start Query
            PackagePeriod::class ,
            'admin/pages/packages/periods/index',
            $is_trash, // Soft Delete
            [ // Other Options
            'condition' => ['where', 'package_id', '=', $id],
                'with'       => ['is_trash' => $is_trash,'packages'=>$packages],
            ]

        ); // end query

    }

    public function create()
    {

        $packages = Package::get();
        return  view('admin.pages.packages.periods.create')->with([
            'packages' => $packages,
            'lang' => $this->lang
        ]);
    }


    public function store(PackagePeriodRequest $request)
    {
        PackagePeriod::create($this->columnsDB($request));

        return  back()->with('success', __('form.response.create package_periods'));
    }

    public function edit()
    {

    }
    public function update(PackagePeriodRequest $request, $id)
    {

        $package = PackagePeriod::where('id', $id)->firstOrFail();
        $package->update($this->columnsDB($request));

        return response(['status' => 'success' ,
            'message' => __('form.response.update periods'),

        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
//         $this->MDT_delete(PackagePeriod::class, $id,true);
        return $this->MDT_delete(PackagePeriod::class, $id);
    }



    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request){



        return [
            'period'   => $request->period,
            'price'   => $request->price,
            'package_id'   => $request->package_id,
        ];
    }
}
