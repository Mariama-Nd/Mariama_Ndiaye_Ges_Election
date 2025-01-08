<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ReminderToVote extends Notification
{
    use Queueable;

    public function via($notifiable)
    {
        return ['mail'];
    }

    public function toMail($notifiable)
    {
        return (new MailMessage)
            ->subject('Rappel : N\'oubliez pas de voter !')
            ->line('Vous n\'avez pas encore voté. Prenez le temps de voter pour le candidat de votre choix.')
            ->action('Voter maintenant', url('/votes'))
            ->line('Merci de votre participation !');
    }
}
