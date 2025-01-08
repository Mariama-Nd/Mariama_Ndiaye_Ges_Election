<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class CheckResultsNotification extends Notification
{
    use Queueable;

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Vérifiez les résultats en temps réel !')
            ->line('Les résultats des votes sont maintenant disponibles. Consultez-les en temps réel.')
            ->action('Voir les résultats', url('/stats'))
            ->line('Merci pour votre engagement !');
    }
}
