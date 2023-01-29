<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller
{

    public function __construct()
    {
        $this->middleware('haveRole:contact.index')->only('index');
        $this->middleware('haveRole:contact.destroy')->only('destroy');
    }

    public function index(){

        $contacts = Contact::latest()->get();

        return view('admin.pages.contact.index' , compact('contacts'));
    }


    public function destroy($id){

        Contact::where('id' , $id)->delete();
    }
}
