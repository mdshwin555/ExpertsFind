<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Consulting extends Model
{
    use HasFactory;
    protected $table = 'consultings';
    protected $fillable = ['consuiting'];

    public function expert(){
        return $this-> hasMany(Expert::class,'consulting_id');
    }
}
