<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Favourite extends Model
{
    use HasFactory;

    protected $table = 'favourites';
    protected $fillable = ['user_id','expert_id'];

    public function user(){
        return $this->belongsTo(User::class,'user_id');
    }

    public function expert()
    {
        return $this->belongsTo(Expert::class,'expert_id');
    }
}
