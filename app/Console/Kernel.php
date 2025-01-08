<?php

namespace App\Console;

use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     */
    protected function schedule(Schedule $schedule)
    {
        // Envoyer une notification aux étudiants sans vote tous les 2 jours
        $schedule->command('notifications:send')
                ->dailyAt('10:00') // À 10h chaque jour
                ->when(function () {
                    return now()->day % 2 === 0; // Tous les 2 jours
                });

        // Notification pour vérifier les résultats tous les 4 jours
        $schedule->command('notifications:send')
                ->dailyAt('14:00') // À 14h chaque jour
                ->when(function () {
                    return now()->day % 4 === 0; // Tous les 4 jours
                });
    }

    /**
     * Register the commands for the application.
     */
    protected function commands(): void
    {
        $this->load(__DIR__.'/Commands');

        require base_path('routes/console.php');
    }
}
