<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Programme extends Model
{
    use HasFactory;

    protected $fillable = ['nom', 'departement_id'];

    public function departement()
    {
        return $this->belongsTo(Departement::class);
    }

    public function etudiants()
    {
        return $this->hasMany(Etudiant::class);
    }
}
