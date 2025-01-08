<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Etudiant extends Model
{
    use HasFactory;

    protected $fillable = [
        'matricule',
        'nom',
        'prenom',
        'naissance',
        'lieu',
        'sexe',
        'adresse',
        'programme_id',
        'telephone',
         'email',
    ];

    public function programme()
    {
        return $this->belongsTo(Programme::class);
    }

    public function candidat()
    {
    return $this->hasOne(Candidat::class);
    }

    public function vote()
    {
        return $this->hasOne(Vote::class);
    }
}
