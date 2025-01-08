<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Candidat extends Model
{
    use HasFactory;

    protected $fillable = ['etudiant_id', 'niveau'];

    public function etudiant()
    {
        return $this->belongsTo(Etudiant::class);
    }

    public function votes()
    {
        return $this->hasMany(Vote::class);
    }
}
