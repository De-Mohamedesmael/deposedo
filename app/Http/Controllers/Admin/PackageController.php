<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\PackageRequest;
use App\Models\Package;
use App\Models\Country;
use App\MyDataTable\MDT_Method_Action;
use App\MyDataTable\MDT_Query;
use Illuminate\Http\Request;

class PackageController extends Controller
{

    use MDT_Query, MDT_Method_Action;

    protected $lang;

    public function __construct()
    {
        $this->lang = app()->getLocale();

        $this->middleware('haveRole:package.index')->only('index');
        $this->middleware('haveRole:package.create')->only(['create', 'store']);
        $this->middleware('haveRole:package.update')->only('update');
        $this->middleware('haveRole:package.destroy')->only('destroy');
        $this->middleware('haveRole:package.restore')->only('restore');
        $this->middleware('haveRole:package.finalDelete')->only('finalDelete');
    }


    public function index()
    {

        $is_trash  = \request()->segment(3) === 'trash';


        return  $this->MDT_Query_method( // Start Query
            Package::class,
            'admin/pages/packages/index',
            $is_trash, // Soft Delete
            [ // Other Options
                'with'    => ['is_trash' => $is_trash],
            ]

        ); // end query
    }


    public function create()
    {
        return  view('admin.pages.packages.create')->with([
            'lang' => $this->lang
        ]);
    }


    public function store(PackageRequest $request)
    {
        Package::create($this->columnsDB($request));

        return  back()->with('success', __('form.response.create package'));
    }


    public function update(PackageRequest $request, $id)
    {

        $package = Package::where('id', $id)->firstOrFail();
        $package->update($this->columnsDB($request,$package->image));

        return response(['status' => 'success' ,
            'message' => __('form.response.update package'),
            'url' => [
                'img' => asset("assets/front/images/$package->image")
            ]
        ]);
        return response(['status' => 'success', 'message' => __('form.response.update package')]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        return $this->MDT_delete(Package::class, $id);
    }



    ///////////////////////////////////////////////////////
    ////                                               ////
    //// ..........  Methods Clean Code .............. ////
    ////                                               ////
    ///////////////////////////////////////////////////////


    public function columnsDB($request, $oldImage = 'default.svg'){

        $imgName = null;

        $img = $request->file('img');

        if ($img) {

            $imgName = \Str::slug($request->name_en).time().'.'.$img->getClientOriginalExtension();
            $img->move(public_path('assets/front/images/packages') , $imgName);
            $imgName='packages/'.$imgName;
        }

        return [
            'name_ar'   => $request->name_ar,
            'name_en'   => $request->name_en,
            'count_product'   => $request->count_product,
            'image'       => $imgName ?? $oldImage,
        ];
    }
}
