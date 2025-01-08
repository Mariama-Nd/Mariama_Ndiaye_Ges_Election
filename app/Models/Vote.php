<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    use HasFactory;

    protected $fillable = ['etudiant_id', 'candidat_id', 'date', 'temps'];

    public function etudiant()
    {
        return $this->belongsTo(Etudiant::class);
    }

    public function candidat()
    {
        return $this->belongsTo(Candidat::class);
    }
}
