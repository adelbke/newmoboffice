<?php

namespace App\Http\Controllers;

use App\Image;
use App\Slider;
use Illuminate\Http\Request;

class SliderController extends Controller
{
    public function index()
    {
        $list = Slider::with('image')->get();
        return view('slider.index',compact('list'));
    }
    public function create(){
        return view('slider.create');
    }

    public function store()
    {
        $data = request()->validate([
            'sliderImage'=>['required','array'],
            'sliderImage.*'=>['image','required']
        ]);

        foreach ($data['sliderImage'] as $image) {
            $path = '/storage/'. $image->store('productSliderImages','public');
            $object = new Image();
            $object->path = $path;
            $object->save();
            $slider = new Slider();
            $slider->image_id = $object->id;
            $slider->save();
        }
        // $path = '/storage/'.$data['sliderImage']->store('productSliderImages','public');
        // $object = new Image();
        // $object->path= $path;
        // $object->save();
        // $slider = new Slider();
        // $slider->image_id = $object->id;
        // $slider->save();

        return redirect()->back()->with('success','Le Slider a été enregistré avec succès');
    }

    public function destroy(Slider $slider)
    {
        $slider->image->delete();
        $slider->delete();
        return redirect()->back()->with('success','Le Slider a été supprimmé avec succès');
    }
}
