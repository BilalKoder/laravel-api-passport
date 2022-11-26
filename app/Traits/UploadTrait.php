<?php
namespace App\Traits;

use File;
use App\Traits\SlugTrait;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

trait UploadTrait
{
    use SlugTrait;
 
        public function uploadImage(UploadedFile $uploadedFile, $name, $folder = null, $disk = 'public'){
        
            $image = $uploadedFile;
            $name = rand() . '_' . time() . '.' . $image->getClientOriginalName();
            $filePath = $folder . $name;
            $file = $uploadedFile->storeAs($folder, $name, $disk);
            return $filePath;
        }

        // uploadImageUpdate(file, object, folder, disk)
        public function uploadImageUpdate(UploadedFile $uploadedFile, $object, $folder = null, $disk = 'public'){
            $image = $uploadedFile;
            $name = rand() . '_' . time() . '.' . $image->getClientOriginalName();
            $filePath = $folder . $name. '.' . $image->getClientOriginalExtension();
            // extra
            if($object->image != '' && $object->image != null){
                $objectOldImage = storage_path('app/public'.$object->image);
                if (File::exists($objectOldImage)) {
                    unlink($objectOldImage);
                }
            }
            // extra
            $file = $uploadedFile->storeAs($folder, $name.'.'.$uploadedFile->getClientOriginalExtension(), $disk);
            return $filePath;
        }
        
    }