<?php

namespace App\Http\Controllers;

use App\Type;
use App\Product;
use App\Http\Resources\ProductResource;
use Illuminate\Http\Request;
use App\Http\Requests\TypeRequest;

class TypeApiController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return Type::all();
    }

    public function children(Type $type){
        return Type::where('parent_type',$type->id)->get();
    }

    public function products(Type $type){
        // return Product::where('type_id',$type->id)->get();
        return ProductResource::collection(Product::where('type_id',$type->id)->get());
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(TypeRequest $request)
    {
        //
        // return $request;

        $type = new Type();

        $type->Name = $request->Name;
        $type->parent_type = $request->parent_type;
        // TODO: take care of the category attribute
        $type->Category = 'Meuble de Bureau';

        $type->save();

        // return $type;
        return response()->json($type, 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Type  $type
     * @return \Illuminate\Http\Response
     */
    public function show(Type $type)
    {
        return $type;
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Type  $type
     * @return \Illuminate\Http\Response
     */
    public function update(TypeRequest $request, Type $type)
    {
        //

        $type->update($request->all());

        return $type;   

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Type  $type
     * @return \Illuminate\Http\Response
     */
    public function destroy(Type $type)
    {
        //
    }
}
