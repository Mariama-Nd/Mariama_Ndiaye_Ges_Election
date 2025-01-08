<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Etudiant;
use Illuminate\Support\Facades\Notification;
use App\Notifications\ReminderToVote;
use App\Notifications\CheckResultsNotification;

class SendNotifications extends Command
{
    protected $signature = 'notifications:send';

    protected $description = 'Envoyer des notifications aux étudiants';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        // Étudiants qui n'ont pas encore voté
        $etudiantsSansVote = Etudiant::doesntHave('vote')->get();

        foreach ($etudiantsSansVote as $etudiant) {
            Notification::route('mail', $etudiant->email)
                ->notify(new ReminderToVote());
        }

        // Tous les étudiants (pour vérifier les résultats)
        $etudiantsTous = Etudiant::all();

        foreach ($etudiantsTous as $etudiant) {
            Notification::route('mail', $etudiant->email)
                ->notify(new CheckResultsNotification());
        }

        $this->info('Notifications envoyées avec succès.');
    }
    
}
