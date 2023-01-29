<?php

namespace App\Http\Controllers\Web\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Web\ContactRequest;
use App\Models\Contact;
use Illuminate\Http\Request;

class ContactController extends Controller
{
    public function save(Request $request){

        $validator = \Validator::make($request->all(), (new ContactRequest())->rules());

        if ($validator->fails()) {

            return response([
                'status' => Response_Fail,
                'message' => $validator->errors()->all(),
            ]);
        }

        Contact::create($validator->validated());

        return response([
            'status' => Response_Success,
        ]);

    }
}
